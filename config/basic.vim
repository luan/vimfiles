" ----------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ----------------------------------------

" Config {{{
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/.undo
endif

" We rely on bash for some things, make sure we use that for shelling out
set shell=/bin/bash
" }}}

" Backups {{{
set swapfile                    " Keep swapfiles
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp
" }}}

" UI {{{
set nu             " Line numbers on
set nowrap         " Line wrapping off
set cmdheight=1    " Make the command area two lines high
set noshowmode     " don't need to show mode since we have airline
set numberwidth=4
set encoding=utf-8
set guioptions=acg
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set cursorline
if !has('nvim')
  set ttyfast
endi
set lazyredraw
if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently
endif

if !has('nvim')
  if has("mouse_sgr")
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  end
end
" }}}

" Behaviors {{{
filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)
set wildmode=list:longest " use emacs-style tab completion when selecting files, etc
set hidden             " Change buffer - without saving
set autowriteall       " Writes on make/shell commands
" set foldmethod=syntax
set foldlevel=20
set formatoptions=crql
set iskeyword+=$,@,-     " Add extra characters that are valid parts of variables
set tags=./tags;/,tags;/
set splitright
if version >= 704
  set completeopt=menu,noinsert,noselect
endif
" }}}

" Text Format {{{
set tabstop=2
set shiftwidth=2 " Tabs under smart indent
set expandtab
" }}}

" Searching {{{
set ignorecase
set smartcase  " Non-case sensitive search
set hlsearch
set wildignore+=.final_builds/*,*/node_modules/*,*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class,*.scssc,*/Godeps/*
if executable('ack')
  set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
endif
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif
" }}}

" Visual {{{
set noshowmatch " Disable jumping to matching bracket when typing
" }}}

" Sounds {{{
set noerrorbells
set novisualbell
" }}}

" Mouse {{{
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes
" }}}

