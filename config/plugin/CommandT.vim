" ---------------
" Command T and ctrlp.vim
" ---------------
" Ensure Ctrl-P isn't bound by default
let g:ctrlp_map = ''

" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
let g:CommandTMaxHeight = 10

" Set the default escape keybinding to, you guessed it, escape.
let g:CommandTCancelMap = '<esc>'

" Dynamically use Command T or ctrlp.vim based on availability of Ruby.
" We do this because Command T is much faster than ctrlp.vim.
if has('ruby')
  " --------
  " Use Command T since we've got Ruby
  " --------

  " Leader Commands
  nnoremap <leader>f :CommandTFlush<cr>\|:CommandT<cr>
  nnoremap <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>
  nnoremap <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
  nnoremap <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
  nnoremap <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
  nnoremap <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
  nnoremap <leader>ge :CommandTFlush<cr>\|:CommandT config<cr>
  nnoremap <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
  nnoremap <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
  nnoremap <leader>gs :CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>
  nnoremap <leader>gj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>
else
  " --------
  " Use ctrlp.vim since we don't have Ruby
  " --------

  " Conditional Mappings
  if has('unix')
    let g:ctrlp_map = '<C-t>'
  else
    let g:ctrlp_map = '<M-t>'
  endif

  " Leader Commands
  nnoremap <leader>f :CtrlPRoot<CR>
endif

" Also map leader commands
nnoremap <leader>u :CtrlPCurFile<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
