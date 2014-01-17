let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir='~/.vim/.cache/ctrlp'
let g:ctrlp_extensions=['funky']
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'

nnoremap <leader>f :CtrlPRoot<cr>
nnoremap <leader>m :CtrlPMRUFiles<cr>
nnoremap <leader>F :CtrlPBufTag<cr>
nnoremap <leader>S :CtrlPTag<cr>
nnoremap <leader>L :CtrlPLine<cr>
nnoremap <leader>o :CtrlPFunky<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
