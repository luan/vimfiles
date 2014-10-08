let g:airline_theme = 'tomorrow'
if !exists("g:airline_powerline_fonts")
  if g:has_powerline_font || (has("gui_running") && &guifont =~ "for Powerline")
    let g:airline_powerline_fonts = 1
  else
    let g:airline_powerline_fonts = 0
  endif
end

if !g:airline_powerline_fonts
  let g:airline_left_sep = ""
  let g:airline_left_alt_sep = ""
  let g:airline_right_sep = ""
  let g:airline_right_alt_sep = ""
endif

let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
