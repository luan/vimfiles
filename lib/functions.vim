" ----------------------------------------
" Functions
" ----------------------------------------

" ---------------
" Convert Ruby 1.8 hash rockets to 1.9 JSON style hashes.
" From: http://git.io/cxmJDw
" Note: Defaults to the entire file unless in visual mode.
" ---------------
command! -bar -range=% NotRocket execute '<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/e' . (&gdefault ? '' : 'g')

" ---------------
" Strip Trailing White Space
" ---------------
" From http://vimbits.com/bits/377
" Preserves/Saves the state, executes a command, and returns to the saved state
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
"strip all trailing white space
command! StripTrailingWhiteSpace :call Preserve("%s/\\s\\+$//e")<CR>

" ---------------
" Quick spelling fix (first item in z= list)
" ---------------
function! QuickSpellingFix()
  if &spell
    normal 1z=
  else
    " Enable spelling mode and do the correction
    set spell
    normal 1z=
    set nospell
  endif
endfunction

command! QuickSpellingFix call QuickSpellingFix()

" ---------------
" Convert Ruby 1.8 hash rockets to 1.9 JSON style hashes.
" From: http://git.io/cxmJDw
" Note: Defaults to the entire file unless in visual mode.
" ---------------
command! -bar -range=% NotRocket execute '<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/e' . (&gdefault ? '' : 'g')

" ---------------
" Strip Trailing White Space
" ---------------
" From http://vimbits.com/bits/377
" Preserves/Saves the state, executes a command, and returns to the saved state
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
"strip all trailing white space
command! StripTrailingWhiteSpace :call Preserve("%s/\\s\\+$//e")<CR>

" ---------------
" Ack
" ---------------

" Find current word in command mode
function! AckGrep()
  let command = "ack ".expand("<cword>")
  cexpr system(command)
  cw
endfunction

function! AckVisual()
  normal gv"xy
  let command = "ack ".@x
  cexpr system(command)
  cw
endfunction

" ---------------
" Tests
" ---------------
function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
    call RunTests(expand("%") . command_suffix)
  else
    call RunTests('')
  end
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  let s:last_command = ":" . spec_line_number . " -b"
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! RunTests(filename)
  let use_vipe = has("gui_running") || (exists("g:always_use_test_server") && g:always_use_test_server)
  let use_tmux = executable('tmux') && !empty($TMUX)

  :wa

  if a:filename == ''
    if use_vipe
      call VipeRerun()
    elseif exists('s:last_command')
      call RunTests(s:last_command)
    endif

    return
  endif

  let command = ''

  if match(a:filename, '\.feature') != -1
    if filereadable("script/test")
      let command = "script/features " . a:filename
    else
      let command = "cucumber " . a:filename
    end
  else
    if filereadable("script/test")
      let command = "script/test " . a:filename
    elseif filereadable("Gemfile") && exists("g:check_gemfile") && g:check_gemfile
      let command = "bundle exec rspec --color " . a:filename
    else
      let command = "rspec --color " . a:filename
    end
  end

  if use_vipe
    call Vipe(command)
  elseif use_tmux
    call VimuxRunCommand(command)
  else
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    exec ":!" . command
  end
endfunction
