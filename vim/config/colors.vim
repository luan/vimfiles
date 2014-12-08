let &t_Co=256

let g:darkcolors = [
      \ 'hybrid',
      \ 'base16-3024',
      \ 'base16-apathy',
      \ 'base16-ashes',
      \ 'base16-atelierdune',
      \ 'base16-atelierforest',
      \ 'base16-atelierheath',
      \ 'base16-atelierlakeside',
      \ 'base16-atelierseaside',
      \ 'base16-bespin',
      \ 'base16-brewer',
      \ 'base16-bright',
      \ 'base16-chalk',
      \ 'base16-codeschool',
      \ 'base16-colors',
      \ 'base16-default',
      \ 'base16-eighties',
      \ 'base16-embers',
      \ 'base16-flat',
      \ 'base16-google',
      \ 'base16-grayscale',
      \ 'base16-greenscreen',
      \ 'base16-harmonic16',
      \ 'base16-isotope',
      \ 'base16-londontube',
      \ 'base16-marrakesh',
      \ 'base16-mocha',
      \ 'base16-monokai',
      \ 'base16-ocean',
      \ 'base16-paraiso',
      \ 'base16-pop',
      \ 'base16-railscasts',
      \ 'base16-shapeshifter',
      \ 'base16-solarized',
      \ 'base16-summerfruit',
      \ 'base16-tomorrow',
      \ 'base16-twilight',
      \ ]

let g:lightcolors = [
      \ 'hybrid-light',
      \ 'base16-3024',
      \ 'base16-apathy',
      \ 'base16-ashes',
      \ 'base16-atelierdune',
      \ 'base16-atelierforest',
      \ 'base16-atelierheath',
      \ 'base16-atelierlakeside',
      \ 'base16-atelierseaside',
      \ 'base16-bespin',
      \ 'base16-brewer',
      \ 'base16-bright',
      \ 'base16-chalk',
      \ 'base16-codeschool',
      \ 'base16-colors',
      \ 'base16-default',
      \ 'base16-eighties',
      \ 'base16-embers',
      \ 'base16-flat',
      \ 'base16-google',
      \ 'base16-grayscale',
      \ 'base16-greenscreen',
      \ 'base16-harmonic16',
      \ 'base16-isotope',
      \ 'base16-londontube',
      \ 'base16-marrakesh',
      \ 'base16-mocha',
      \ 'base16-monokai',
      \ 'base16-ocean',
      \ 'base16-paraiso',
      \ 'base16-pop',
      \ 'base16-railscasts',
      \ 'base16-shapeshifter',
      \ 'base16-solarized',
      \ 'base16-summerfruit',
      \ 'base16-tomorrow',
      \ 'base16-twilight',
      \ ]

function! colors#_colors()
  let l:colors = g:darkcolors
  if exists('g:background_style') && g:background_style == 'light'
    let l:colors = g:lightcolors
  endif
  return colors
endfunction

function! colors#_change(index)
  let l:colors = colors#_colors()
  let l:idx = a:index
  if idx < 0
    let l:idx = len(colors) - 1
  elseif idx > len(colors) - 1
    let l:idx = 0
  endif

  let l:name = colors[idx]
  if !has('gui_running') && name == 'hybrid'
    silent !source $HOME/.vim/scripts/shell-colors-vim-hybrid/shell-colors-vim-hybrid.sh
  endif
  execute "colorscheme ".name
  let g:colors_name = name
endfunction

function! colors#next()
  let l:colors = colors#_colors()
  let l:next_index = index(colors, g:colors_name) + 1
  call colors#_change(next_index)
endfunction

function! colors#prev()
  let l:colors = colors#_colors()
  let l:prev_index = index(colors, g:colors_name) - 1
  call colors#_change(prev_index)
endfunction

function! colors#toggle_background()
  if exists('g:background_style') && g:background_style == 'light'
    let g:background_style = 'dark'
  else
    let g:background_style = 'light'
  endif
  call colors#_change(0)
endfunction

command! ColorsPrev call colors#prev()
command! ColorsNext call colors#next()
command! ColorsToggleBG call colors#toggle_background()

map <silent><F2> :ColorsPrev<cr>
map <silent><F3> :ColorsNext<cr>
map <silent><F4> :ColorsToggleBG<cr>
map <silent><F1> :echo colors_name<cr>
call colors#_change(0)
