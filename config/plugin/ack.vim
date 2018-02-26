if executable('rg')
  let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ag Ack
cnoreabbrev Rg Ack

nnoremap <Leader>a :Ack!<Space>

