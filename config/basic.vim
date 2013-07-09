" ----------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ----------------------------------------

" Config {{{
" hardcore_mode for people who really want to use vim to it's maximum
if !exists("g:hardcore_mode")
  let g:hardcore_mode=1
end
set undodir^=~/.vim/undo
" }}}

" Backups {{{
set swapfile
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
" }}}

" UI {{{
set nu             " Line numbers on
set nowrap         " Line wrapping off
set cmdheight=2    " Make the command area two lines high
set numberwidth=5
set encoding=utf-8
set guioptions=acg
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set cursorline
if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently
endif
" }}}

" Behaviors {{{
filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)
set wildmode=list:longest " use emacs-style tab completion when selecting files, etc
set hidden             " Change buffer - without saving
set autowriteall       " Writes on make/shell commands
set foldmethod=syntax
set cpoptions+=$
set formatoptions=crql
set iskeyword+=$,@,-     " Add extra characters that are valid parts of variables
" }}}

" Status Line {{{
set statusline=[%n]\ %f\ %m\ %y
set statusline+=%{fugitive#statusline()} " Show git details"
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''} " Show RVM details"
set statusline+=%w              " [Preview]
set statusline+=%=              " Left/right separator
set statusline+=%c,             " Cursor column
set statusline+=%l/%L           " Cursor line/total lines
set statusline+=\ %P            " Percent through file
" }}}

" Text Format {{{
set tabstop=2
set shiftwidth=2 " Tabs under smart indent
set cindent
set expandtab
" }}}

" Searching {{{
set smartcase  " Non-case sensitive search
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class,*.scssc
" }}}

" Visual {{{
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
" }}}

" Sounds {{{
set noerrorbells
set novisualbell
" }}}

" Mouse {{{
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes
" }}}

