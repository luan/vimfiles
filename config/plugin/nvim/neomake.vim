if has('nvim')
  " open list automatically but preserve cursor position
  let g:neomake_open_list = 2
  let g:neomake_list_height = 5

  autocmd! BufWritePost * Neomake
endif
