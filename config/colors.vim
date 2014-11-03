let &t_Co=256

let g:darkcolors = [
      \ 'hybrid',
      \ '256-grayvim',
      \ '256-jungle',
      \ 'Monokai',
      \ 'Tomorrow-Night',
      \ 'Tomorrow-Night-Eighties',
      \ 'apprentice',
      \ 'babymate256',
      \ 'bvemu',
      \ 'darkburn',
      \ 'darth',
      \ 'desertEx',
      \ 'devbox-dark-256',
      \ 'flatcolor',
      \ 'grb256',
      \ 'gruvbox',
      \ 'holokai',
      \ 'iceberg',
      \ 'jellybeans',
      \ 'kolor',
      \ 'last256',
      \ 'lilypink',
      \ 'molokai',
      \ 'muon',
      \ 'mustang',
      \ 'neverland',
      \ 'seoul256',
      \ 'smyck',
      \ 'sorcerer',
      \ ]

let g:lightcolors = [
      \ 'Tomorrow',
      \ 'autumn',
      \ 'bubblegum',
      \ 'hybrid-light',
      \ 'lucius',
      \ 'seoul256-light',
      \ 'sol-term',
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
