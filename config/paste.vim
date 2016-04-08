function! s:ReplacePaste()
  set paste
  exe 'normal! `<"_cv`>'."\<c-r>".v:register."\<esc>"
  set nopaste
endfunction

" vnoremap <silent> p :call <sid>ReplacePaste()<cr>

