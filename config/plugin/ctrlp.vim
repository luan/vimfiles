let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_max_height=15
let g:ctrlp_show_hidden=0
let g:ctrlp_follow_symlinks=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_files=20000
let g:ctrlp_cache_dir='~/.vim/.cache/ctrlp'
let g:ctrlp_reuse_window='startify'
let g:ctrlp_extensions=['funky']
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

nnoremap <leader>f :CtrlPRoot<cr>
nnoremap <leader>m :CtrlPMRUFiles<cr>
nnoremap <leader>F :CtrlPBufTag<cr>
nnoremap <leader>S :CtrlPTag<cr>
nnoremap <leader>L :CtrlPLine<cr>
nnoremap <leader>o :CtrlPFunky<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
