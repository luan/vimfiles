" ----------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ----------------------------------------

" Color {{{
let g:solarized_termcolors=256
set background=light
colorscheme solarized
" }}}

" Backups {{{
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
" }}}

" UI {{{
set ruler          " Ruler on
set nu             " Line numbers on
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
set encoding=utf-8
if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently
endif
" }}}

" Behaviors {{{
filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)
syntax enable
set autoread           " Automatically reload changes if detected
set wildmode=longest,list " use emacs-style tab completion when selecting files, etc
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)
set foldmethod=syntax
set nofoldenable
set formatoptions=crql
set iskeyword+=$,@     " Add extra characters that are valid parts of variables
" Better complete options to speed it up
set complete=.,w,b,u,U
" }}}

" Text Format {{{
set tabstop=2
set backspace=2  " Delete everything with backspace
set shiftwidth=2 " Tabs under smart indent
set cindent
set autoindent
set smarttab
set expandtab
set backspace=2
" }}}

" Searching {{{
nnoremap / /\v
vnoremap / /\v
set gdefault
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch
set showmatch
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
set t_vb=
" }}}

" Mouse {{{
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes
" }}}

" Window {{{
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999
" }}}

" Filytypes {{{
au FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et
au User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

au BufNewFile,BufReadPost *.jade setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" }}}
