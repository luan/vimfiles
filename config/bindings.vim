" ----------------------------------------
" Bindings
" ----------------------------------------

" Note: This line MUST come before any <leader> mappings
let mapleader=","

" Common typos {{{
command! W w
command! Q q
command! WQ wq
command! Wq wq
map <F1> <Esc>
imap <F1> <Esc>
" Removes doc lookup binding because it's easy to fat finger

nmap K k
vmap K k
" }}}

" Easier Scrolling (think j/k with left hand) {{{
" All variations are mapped for now until I get used to one
" C/M/D + d (page up)
" C/M/D + f (page down)
nmap <C-d> <C-b>
if has("gui_macvim")
  nmap <D-f> <C-f>
  nmap <D-d> <C-b>
else
  nmap <M-f> <C-f>
  nmap <M-d> <C-b>
endif
" }}}

" Other {{{
" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :
" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Yank entire buffer with gy
nmap gy :%y+<cr>

" Make line completion easier
imap <C-l> <C-x><C-l>
" }}}

" ---------------
" Leader Commands
" ---------------

" Spelling {{{
" Toggle spelling mode with ,s
nmap <silent> <leader>s :set spell!<CR>
" Edit vimrc with ,v
nmap <silent> <leader>v :e ~/.vim/vimrc<CR>
" }}}

" Window {{{
" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
" Previous Window
nmap <silent> <C-p> :wincmd p<CR>
" Equal Size Windows
nmap <silent> <leader>w= :wincmd =<CR>
" Swap Windows
nmap <silent> <leader>wx :wincmd x<CR>

" Window Splitting
nmap <silent> <leader>sh :split<CR>
nmap <silent> <leader>sv :vsplit<CR>
" Because I'm dyslexic
nmap <silent> <leader>hs :split<CR>
nmap <silent> <leader>vs :vsplit<CR>
nmap <silent> <leader>sc :close<CR>
" }}}
