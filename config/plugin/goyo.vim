function! s:goyo_enter()
  silent !i3-msg fullscreen || true
  silent !tmux set status off || true
  silent !tmux list-panes -F \#F | grep -q Z || tmux resize-pane -Z || true
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set nolazyredraw
  execute 'SignifyDisable'
  execute 'Limelight'
endfunction

function! s:goyo_leave()
  silent !i3-msg fullscreen || true
  silent !tmux set status on || true
  silent !tmux list-panes -F \#F | grep -q Z && tmux resize-pane -Z || true
  set showmode
  set showcmd
  set scrolloff=5
  execute ':SignifyEnable'
  execute ':Limelight!'
endfunction

let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1

augroup luan_goyo
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
  autocmd VimResized * if exists('#goyo') | exe "normal \<c-w>=" | redraw! | endif
augroup END

nmap <leader>Z :Goyo<cr>
nmap <leader>X :Limelight!!<cr>
nmap <Leader>i <Plug>(Limelight)
xmap <Leader>i <Plug>(Limelight)

