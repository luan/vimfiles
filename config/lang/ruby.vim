autocmd FileType ruby setlocal ts=2 sts=2 sw=2 norelativenumber nocursorline re=1 foldmethod=syntax
if !exists('g:vim_lite')
  autocmd FileType ruby RainbowToggleOff
endif
