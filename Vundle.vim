runtime! lib/Vundle.before.vim

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" ---------------
" Plugin Bundles
" ---------------

" Navigation
Bundle 'wincent/Command-T'
" ,,f
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'

" UI Additions
" That bunch of information on the statusbar
Bundle 'Lokaltog/vim-powerline'
" Awesome colorscheme
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'altercation/vim-colors-solarized'

" Commands
" \\\
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-abolish'
" :Move|Remove|Unlink|...
Bundle 'tpope/vim-eunuch'
Bundle 'godlygeek/tabular'
Bundle 'mileszs/ack.vim'
" ,q (Quickfix) | ,l (Location)
Bundle 'milkypostman/vim-togglelist'
Bundle 'luan/vipe'

" Automatic Helpers
" Adds 'end' properly
Bundle 'tpope/vim-endwise'
Bundle 'ervandew/supertab'
Bundle 'gregsexton/MatchTag'
" ???????
Bundle 'Shougo/neocomplcache'
Bundle 'tpope/vim-repeat'

" MatchIt
Bundle 'Spaceghost/vim-matchit'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" Snippets
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'

" Language Additions
"   Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-rvm'
Bundle 'ecomba/vim-ruby-refactoring'

"   HTML
Bundle 'tpope/vim-haml'
Bundle 'nono/vim-handlebars'
Bundle 'othree/html5.vim'
Bundle 'indenthtml.vim'

"   JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'alfredodeza/jacinto.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'luan/jasmine.vim'

"   CSS
Bundle 'mutewinter/vim-css3-syntax'

"   Other Languages
Bundle 'hallison/vim-markdown'

" Libraries
Bundle 'L9'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

