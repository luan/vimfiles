" vim mode-switch lag fix
if ! has("gui_running")
  set ttimeoutlen=10
  augroup FastEscape autocmd!
    au InsertEnter * set timeoutlen=50
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
