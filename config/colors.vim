let g:gruvbox_italic=1

let s:colors = [
      \ 'hybrid',
      \ 'gruvbox',
      \ 'base16-3024',
      \ 'base16-apathy',
      \ 'base16-ashes',
      \ 'base16-atelier-dune',
      \ 'base16-atelier-forest',
      \ 'base16-atelier-heath',
      \ 'base16-atelier-lakeside',
      \ 'base16-atelier-seaside',
      \ 'base16-bespin',
      \ 'base16-brewer',
      \ 'base16-bright',
      \ 'base16-chalk',
      \ 'base16-codeschool',
      \ 'base16-default-dark',
      \ 'base16-eighties',
      \ 'base16-embers',
      \ 'base16-flat',
      \ 'base16-google-dark',
      \ 'base16-grayscale-dark',
      \ 'base16-greenscreen',
      \ 'base16-harmonic-dark',
      \ 'base16-isotope',
      \ 'base16-marrakesh',
      \ 'base16-mocha',
      \ 'base16-monokai',
      \ 'base16-ocean',
      \ 'base16-paraiso',
      \ 'base16-pop',
      \ 'base16-railscasts',
      \ 'base16-shapeshifter',
      \ 'base16-solarized-dark',
      \ 'base16-summerfruit-dark',
      \ 'base16-tomorrow',
      \ 'base16-twilight',
      \ ]

function! colors#_change(index)
  let l:idx = a:index
  if l:idx < 0
    let l:idx = len(s:colors) - 1
  elseif l:idx > len(s:colors) - 1
    let l:idx = 0
  endif

  let l:name = s:colors[l:idx]
  silent! execute 'colorscheme '.l:name
endfunction

function! colors#_callback()
  hi MatchParen cterm=underline ctermbg=none ctermfg=none gui=underline guifg=NONE guibg=NONE
endfunction

function! colors#next()
  let l:next_index = index(s:colors, g:colors_name) + 1
  call colors#_change(l:next_index)
endfunction

function! colors#prev()
  let l:prev_index = index(s:colors, g:colors_name) - 1
  call colors#_change(l:prev_index)
endfunction

function! colors#toggle_background()
  if &background ==# 'light'
    set background=dark
  else
    set background=light
  endif
endfunction

function! colors#peek()
  echo g:colors_name . ' - ' . &background
endfunction

command! ColorsPrev call colors#prev()
command! ColorsNext call colors#next()
command! ColorsToggleBG call colors#toggle_background()
command! ColorsPeek call colors#peek()

map <silent><F2> :ColorsPrev<cr>
map <silent><F3> :ColorsNext<cr>
map <silent><F4> :ColorsToggleBG<cr>
map <silent><F1> :ColorsPeek<cr>
set background=dark

if has('termguicolors')
  set termguicolors
  if &term =~# '^screen' || &term =~# '^tmux'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif

augroup luan_colors
  autocmd! ColorScheme * silent! call colors#_callback()
augroup END

try
  colorscheme hybrid
catch
endtry
