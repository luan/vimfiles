if has('nvim')
  let g:neomake_go_enabled_makers = ['go']
  autocmd! BufWritePost * Neomake
endif
