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

  " Conditional Mappings
  if has('unix')
    nnoremap <silent><C-t> :CommandT<CR>
  else
    nnoremap <silent><M-t> :CommandT<CR>
  endif

  " Leader Commands
  nnoremap <leader>t :CommandT<CR>
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
  nnoremap <leader>t :CtrlPRoot<CR>
  nnoremap <leader>b :CtrlPBuffer<CR>
endif

" Always use CtrlP for most recently used files and relative dierctory.
if has('unix')
  nnoremap <silent><C-u> :CtrlPCurFile<CR>
else
  nnoremap <silent><M-u> :CtrlPCurFile<CR>
endif

" Also map leader commands
nnoremap <leader>u :CtrlPCurFile<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
