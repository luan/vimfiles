" ---------------
" Fugitive
" ---------------
nmap <leader>gc :Gcommit<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gp :Git push<CR>
 " Mnemonic, gu = Git Update
nmap <leader>gu :Git pull<CR>
nmap <leader>gd :Gdiff<CR>
" Exit a diff by closing the diff window
nmap <leader>gx :wincmd h<CR>:q<CR>

