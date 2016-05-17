" ----------------------------------------
" Auto Commands
" ----------------------------------------

if has("autocmd")
  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " Fix trailing whitespace in my most used programming langauges
  autocmd FileType vim set fdm=marker foldmarker={{{,}}}

  autocmd FileType yaml,concourse :RainbowToggleOff

  if exists("g:autosave") && g:autosave == 1
    autocmd FocusLost * silent! wa
  endif

  augroup vimrcEx
    " Clear all autocmds in the group
    autocmd!
    " Jump to last cursor position unless it's invalid or in an event handler
    autocmd BufReadPost *
          \ if &filetype != "gitcommit" && line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
  augroup END

  au FileType qf nnoremap <buffer> <Enter> <Enter>
endif
