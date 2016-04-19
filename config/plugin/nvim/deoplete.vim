if has('nvim')
  let g:deoplete#enable_at_startup = 1

  let g:deoplete#omni_patterns = {}

  " autocomplete on just about any character
  let g:deoplete#omni_patterns.go = '[a-zA-Z_\.]{3,}'

  " autocomplete only on attributes; doesn't seem to complete local vars
  let g:deoplete#omni_patterns.elm = '\.'

  " tab for cycling through options
  inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

  " enter closes options if present and inserts linebreak
  " apparently this has to be that complicated
  inoremap <silent> <CR> <C-r>=<SID>close_and_linebreak()<CR>
  function! s:close_and_linebreak()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  endfunction
endif
