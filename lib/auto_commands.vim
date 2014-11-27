" ----------------------------------------
" Auto Commands
" ----------------------------------------

if has("autocmd")
  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " Fix trailing whitespace in my most used programming langauges
  autocmd BufWritePre *.py,*.js,*.coffee,*.rb,*.c silent! :StripTrailingWhiteSpace
  autocmd FileType vim set fdm=marker foldmarker={{{,}}}

  if exists("g:autosave") && g:autosave == 1
    autocmd FocusLost * silent! wa
  endif

  augroup vimrcEx
    " Clear all autocmds in the group
    autocmd!
    autocmd FileType text setlocal textwidth=78
    " Jump to last cursor position unless it's invalid or in an event handler
    autocmd BufReadPost *
          \ if &filetype != "gitcommit" && line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif

    "for ruby, autoindent with two spaces, always expand tabs
    autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
    autocmd FileType python set sw=4 sts=4 et

    autocmd! BufRead,BufNewFile *.sass setfiletype sass 

    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
    autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

    " Don't syntax highlight markdown because it's often wrong
    autocmd! FileType mkd setlocal syn=off

    " Leave the return key alone when in command line windows, since it's used
    " to run commands there.
    autocmd! CmdwinEnter * :unmap <cr>
    autocmd! CmdwinLeave * :call MapCR()
  augroup END

  autocmd! FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et
  autocmd! User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

  autocmd! BufNewFile,BufReadPost *.jade setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
  autocmd! BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
  autocmd! BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

  augroup golang
    autocmd FileType go compiler go
    autocmd! BufEnter *.go call golang#buffcommands()
  augroup END

  autocmd! BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
  autocmd! BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
  autocmd! BufNewFile,BufReadPost *.coffee setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab

  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()
endif
