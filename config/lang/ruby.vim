augroup luan_ruby
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 norelativenumber nocursorline re=1 foldmethod=syntax
augroup END

let g:neomake_ruby_enabled_makers = ['mri', 'rubylint']
