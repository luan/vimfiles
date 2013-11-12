runtime! lib/NeoBundle.before.vim

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" ---------------
" Plugin Bundles
" ---------------

" Defaults
NeoBundle 'tpope/vim-sensible'

" vimproc
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Navigation
NeoBundle 'JazzCore/ctrlp-cmatcher', {
  \ 'depends': 'kien/ctrlp.vim',
  \ 'build': {
  \     'mac': './install_linux.sh',
  \     'unix': './install_linux.sh',
  \     'windows': 'install_windows.bat'
  \   }
  \ }
NeoBundle 'kien/ctrlp.vim', { 'depends': 'tacahiroy/ctrlp-funky' }
NeoBundle 'scrooloose/nerdtree'

" UI Additions
" colorschemes
NeoBundle 'luan/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'kshenoy/vim-signature'
NeoBundle 'bling/vim-airline'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'jszakmeister/vim-togglecursor'

" Commands
" gc
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'gregsexton/gitv', {'depends':['tpope/vim-fugitive'], 'autoload':{'commands':'Gitv'}}
NeoBundle 'tpope/vim-abolish'
" :Move|Remove|Unlink|...
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'godlygeek/tabular'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'luan/vipe', {
  \   'build' : {
  \     'mac' : 'ln -s `pwd`/vipe /usr/local/bin || echo',
  \     'unix' : 'ln -s `pwd`/vipe ~/bin || echo',
  \    },
  \ }

NeoBundleLazy 'benmills/vimux', {'autoload':{'commands':'Vimux'}}
NeoBundle 'milkypostman/vim-togglelist'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'maxbrunsfeld/vim-emacs-bindings'
NeoBundle 'mbbill/undotree'

" Automatic Helpers
" Adds 'end' properly
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'scrooloose/syntastic'

" MatchIt
NeoBundle 'matchit.zip'
NeoBundleDepends 'kana/vim-textobj-user'
NeoBundle 'lucapette/vim-textobj-underscore'
NeoBundle 'nelstrom/vim-textobj-rubyblock'

" Snippets
NeoBundle 'honza/vim-snippets'
NeoBundle 'MarcWeber/ultisnips'

" Language Additions
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'ecomba/vim-ruby-refactoring'
NeoBundle 'tpope/vim-fireplace'

"   JavaScript
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'maksimr/vim-jsbeautify', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffee']}}
NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}

"   CSS / HTML
NeoBundleLazy 'mattn/emmet-vim', {'autoload':{'filetypes':['html','css']}}
NeoBundleLazy 'tpope/vim-haml', {'autoload':{'filetypes':['haml']}}
NeoBundleLazy 'nono/vim-handlebars', {'autoload':{'filetypes':['handlebars']}}
NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload':{'filetypes':['scss','sass']}}
NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','scss','sass']}}
NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
NeoBundleLazy 'juvenn/mustache.vim', {'autoload':{'filetypes':['mustache']}}
NeoBundleLazy 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}

NeoBundleCheck
