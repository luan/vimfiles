" ----------------------------------------
" Bindings
" ----------------------------------------

" Note: This line MUST come before any <leader> mappings
let g:mapleader=","

set pastetoggle=<F6>
map <F6> :set invpaste<CR>:set paste?<CR>

" Edit vimrc with ,vi
nmap <silent> <leader>vi :e ~/.vim/vimrc<CR>

nnoremap j gj
nnoremap k gk
" }}}

" Common typos {{{
command! W w
command! Q q
command! WQ wq
command! Wq wq
imap jk <Esc>
map <F1> <Esc>
imap <F1> <Esc>
" Removes doc lookup binding because it's easy to fat finger

nnoremap <silent> <C-l> <c-w>l
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" }}}

" Other {{{
" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14

" Make line completion easier
imap <C-l> <C-x><C-l>
" reselect visual block after indent
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
map <leader>Y :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%")<CR>
map <leader>C :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>

" create fold in SCSS
nnoremap <leader>S ?{<CR>jV/^\s*\}$<CR>k:sort<CR>:noh<CR>
vnoremap <leader>S :sort<CR>
nnoremap <silent> <space> :noh<cr>
nnoremap <leader>=  gg=G``

function! CRWriteIfNecessary()
  if !&modified || &readonly || &filetype == "qf"
    " Execute a normal enter when in Quickfix list.
    execute "normal! \<enter>"
  else
    :write
  endif
endfunction
function! MapCR()
  nnoremap <silent> <enter> :call CRWriteIfNecessary()<CR>
endfunction
call MapCR()


nnoremap <silent><leader><C-]> <C-w><C-]><C-w>T
nnoremap <silent><leader>o o<esc>
nnoremap <silent><leader>O O<esc>
" }}}

" Test runner {{{
" Run this file
map <leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>T :call RunNearestTest()<cr>
" }}}
