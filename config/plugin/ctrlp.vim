let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:50'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir='~/.vim/.cache/ctrlp'
let g:ctrlp_switch_buffer = '0'

let g:ctrlp_map = ''
nnoremap <C-p> :CtrlPCurWD<cr>
nnoremap <leader>f :CtrlPCurWD<cr>
nnoremap <leader>m :CtrlPMRUFiles<cr>
nnoremap <leader>F :CtrlPBufTag<cr>
nnoremap <leader>S :CtrlPTag<cr>
nnoremap <leader>L :CtrlPLine<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

function! s:define_user_command()
  let l:expr = '\.final_builds/*\|node_modules/*\|\.o$\|\.obj$\|\.exe$\|\.so$\'
  let l:expr = l:expr . '|\.dll$\|\.pyc$\|\.svn\|\.hg\|\.bzr\|\.git\|\.sass-cache\'
  let l:expr = l:expr . '|\.class\|\.scssc\|Godeps/*'

  " Set the user_command option
  if executable('ag')
    let g:ctrlp_use_caching = 0
    let l:cmd = 'ag %s -U -l --hidden --nocolor -g ""'
  else
    let l:cmd = 'find %s -type f'
  endif

  " Set the user_command option
  let g:ctrlp_user_command = has('win32') || has('win64')
        \ ? 'dir %s /-n /b /s /a-d | findstr /V /l "' . l:expr . '"'
        \ : l:cmd . ' | grep -v "'. l:expr .'"'
endfunction

call s:define_user_command()
