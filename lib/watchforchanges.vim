" If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file.
"
" There can be cases where you can be working away, and Vim does not
" realize the file has changed. This command will force Vim to check
" more often.
"
" Calling this command sets up autocommands that check to see if the
" current buffer has been modified outside of vim (using checktime)
" and, if it has, reload it for you.
"
" This check is done whenever any of the following events are triggered:
" * BufEnter
" * CursorMoved
" * CursorMovedI
" * CursorHold
" * CursorHoldI
"
" In other words, this check occurs whenever you enter a buffer, move the cursor,
" or just wait without doing anything for 'updatetime' milliseconds.
"
" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname ==# '*'
    let l:id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let l:bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr 'Buffer ' . a:bufname . " doesn't exist"
      return
    end
    let l:id = 'WatchForChanges'.bufnr(a:bufname)
    let l:bufspec = a:bufname
  end
  if len(a:000) == 0
    let l:options = {}
  else
    if type(a:1) == type({})
      let l:options = a:1
    else
      echoerr 'Argument must be a Dict'
    end
  end
  let l:autoread    = has_key(l:options, 'autoread')    ? l:options['autoread']    : 0
  let l:toggle      = has_key(l:options, 'toggle')      ? l:options['toggle']      : 0
  let l:disable     = has_key(l:options, 'disable')     ? l:options['disable']     : 0
  let l:more_events = has_key(l:options, 'more_events') ? l:options['more_events'] : 0
  let l:while_in_this_buffer_only = has_key(l:options, 'while_in_this_buffer_only') ? l:options['while_in_this_buffer_only'] : 0
  if l:while_in_this_buffer_only
    let l:event_bufspec = a:bufname
  else
    let l:event_bufspec = '*'
  end
  let l:reg_saved = @"
  "let autoread_saved = &autoread
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.l:id
  redir END
  let l:defined = (@" !~# 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      if a:bufname ==# '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.l:id
      if a:bufname !=# '*'
        exec 'au BufDelete    '.a:bufname . " execute 'au! ".l:id."' | execute 'augroup! ".l:id."'"
      end
        exec 'au BufEnter     '.l:event_bufspec . ' :checktime '.l:bufspec
        exec 'au CursorHold   '.l:event_bufspec . ' :checktime '.l:bufspec
        exec 'au CursorHoldI  '.l:event_bufspec . ' :checktime '.l:bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if l:more_events
        exec 'au CursorMoved  '.l:event_bufspec . ' :checktime '.l:bufspec
        exec 'au CursorMovedI '.l:event_bufspec . ' :checktime '.l:bufspec
      end
    augroup END
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      if a:bufname ==# '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.l:id
    silent! exec 'augroup! '.l:id
  end
  let @"=l:reg_saved
endfunction

let s:autoreadargs={'autoread':1}
execute WatchForChanges('*',s:autoreadargs)
