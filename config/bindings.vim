" ----------------------------------------
" Bindings
" ----------------------------------------

" Note: This line MUST come before any <leader> mappings
let g:mapleader=','
let g:maplocalleader = '-'

" Basics {{{

set pastetoggle=<F6>
map <F6> :set invpaste<CR>:set paste?<CR>

" Edit vimrc with ,vi
nmap <silent> <leader>vi :e ~/.vim/vimrc<CR>
nmap <silent> <leader>vb :e ~/.vimrc.local.before<CR>
nmap <silent> <leader>vl :e ~/.vimrc.local<CR>
nmap <silent> <leader>vp :e ~/.vimrc.local.plugins<CR>

nnoremap j gj
nnoremap k gk

noremap <c-\> ,
" }}}

" Common typos {{{
command! W w
command! Q q
command! WQ wq
command! Wq wq

nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" }}}

" Other {{{
vnoremap < <gv
vnoremap > >gv
" make Y consistent with C and D. See :help Y.
nnoremap Y y$
" Y in visual mode copies to system clipboard
vmap Y "+y
" }}}

" Open files in current directory {{{
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nmap <leader>e :edit %%
nmap <leader>v :view %%

nnoremap <leader><leader> <c-^>
" }}}

" Switch between test and production code {{{
nnoremap <leader>. :A<cr>
" }}}

" ---------------
" Leader Commands
" ---------------

" {{{ File Jumping
"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> <leader>z :bp<CR>
nnoremap <silent> <leader>x :bn<CR>
" }}}

" Spelling {{{
" Toggle spelling mode with ,s
nmap <silent> <leader>ss :set spell!<CR>
nmap <silent> <leader>sf :QuickSpellingFix<CR>
" }}}

" Window {{{
" Window Movement
" Equal Size Windows
nmap <silent> <leader>w= :wincmd =<CR>
" Swap Windows
nmap <silent> <leader>wx :wincmd x<CR>

" Window Splitting
nmap <silent> <leader>hs :split<CR>
nmap <silent> <leader>vs :vsplit<CR>
nmap <silent> <leader>sc :close<CR>
" }}}

" Other {{{
map <leader>YY :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%")<CR>
map <leader>YL :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>

nnoremap <silent> <space> :noh<cr>
nnoremap <leader>=  gg=G``

nnoremap <unique> <expr> <CR> empty(&buftype) ? ':w<CR>' : '<CR>'

nnoremap <silent><leader><C-]> <C-w><C-]><C-w>T
" }}}

" Test runner {{{
" Run this file
map <leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>T :call RunNearestTest()<cr>

map <leader><space> :Vipe <CR>
map <leader>p :VipePop <CR>
" }}}
