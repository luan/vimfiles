" ----------------------------------------
" Bindings
" ----------------------------------------

" Note: This line MUST come before any <leader> mappings
let mapleader=","

set pastetoggle=<F2>

" Disable arrow keys {{{
if g:hardcore_mode
  imap <up> <nop>
  imap <down> <nop>
  imap <left> <nop>
  imap <right> <nop>
  map <up> <nop>
  map <down> <nop>
  map <left> <nop>
  map <right> <nop>
end
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

nmap K k
vmap K k
" }}}

" Other {{{
" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14

" Make line completion easier
imap <C-l> <C-x><C-l>
" }}}

" Open files in current directory {{{
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

nnoremap <leader><leader> <c-^>
" }}}

" Switch between test and production code {{{
nnoremap <leader>. :call OpenTestAlternate()<cr>
" }}}

" MULTIPURPOSE TAB KEY (supertab is crazy) {{{
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
" }}}


" ---------------
" Leader Commands
" ---------------

" Spelling {{{
" Toggle spelling mode with ,s
nmap <silent> <leader>s :set spell!<CR>
" Edit vimrc with ,vi
nmap <silent> <leader>vi :e ~/.vim/vimrc<CR>
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
nmap <silent> <leader>hs :split<CR>
nmap <silent> <leader>vs :vsplit<CR>
nmap <silent> <leader>sc :close<CR>
" }}}

" Other {{{
" create fold in SCSS
nnoremap <leader>S ?{<CR>jV/^\s*\}$<CR>k:sort<CR>:noh<CR>
vnoremap <leader>S :sort<CR>
nnoremap <silent> <space> :noh<cr>
nnoremap <leader>=  gg=G``
" }}}

" Rails specific {{{
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
" }}}

" Ack {{{
vmap <leader>a :call AckVisual()<cr>
nmap <leader>a :call AckGrep()<cr>
" }}}

" Test runner {{{
" Run this file
map <leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>T :call RunNearestTest()<cr>
" Run all test files
map <leader>at :call RunTests('spec')<cr>
" }}}

" Powify Bindings {{{
" Restart the server
map <leader>pr :!powify restart<cr>
" }}
