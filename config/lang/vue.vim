augroup luan_vue
  autocmd!
  autocmd BufWritePost *.vue syntax sync fromstart
  autocmd BufReadPost *.vue syntax sync fromstart
  autocmd FileType vue syntax sync fromstart
augroup END
let g:vue_disable_pre_processors=1
