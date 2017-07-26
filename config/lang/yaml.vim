" disable fucking stupid yaml indenting logic
augroup luan_yml
  autocmd!
  autocmd FileType yaml setlocal indentexpr=
  autocmd FileType yaml setlocal norelativenumber nocursorline
augroup END
