" open list automatically but preserve cursor position
let g:neomake_open_list = 2
let g:neomake_list_height = 5

augroup neomake
  autocmd! BufWritePost * Neomake
augroup END

nmap <silent> <C-j> <Plug>unimpairedLNext
nmap <silent> <C-k> <Plug>unimpairedLPrevious

nmap <silent> <C-h> <Plug>unimpairedQNext
nmap <silent> <C-l> <Plug>unimpairedQPrevious
