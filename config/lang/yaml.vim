" disable fucking stupid yaml indenting logic
augroup yml
  autocmd FileType yaml setlocal indentexpr=
  autocmd FileType yaml setlocal norelativenumber nocursorline
augroup END
