if has('nvim')
  let g:deoplete#enable_at_startup = 1

  let g:deoplete#omni_patterns = {}

  " enter closes options if present and inserts linebreak
  " apparently this has to be that complicated
  inoremap <silent> <CR> <C-r>=<SID>close_and_linebreak()<CR>
  function! s:close_and_linebreak()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  endfunction
endif
