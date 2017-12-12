let g:airline_theme = 'tomorrow'
if !exists('g:airline_powerline_fonts')
  if (has('gui_running') && &guifont =~# 'for Powerline')
    let g:airline_powerline_fonts = 1
  else
    let g:airline_powerline_fonts = 0
  endif
end

if !g:airline_powerline_fonts
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
endif

let g:airline_extensions = ['branch', 'netrw', 'ale', 'tabline']

