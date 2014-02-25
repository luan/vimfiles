runtime! lib/NeoBundle.before.vim

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" ---------------
" Plugin Bundles
" ---------------

" Defaults
NeoBundle 'tpope/vim-sensible'

" Navigation
NeoBundle 'kien/ctrlp.vim', { 'depends': 'tacahiroy/ctrlp-funky' }
NeoBundle 'scrooloose/nerdtree'

" UI Additions
" colorschemes
NeoBundle 'luan/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'kshenoy/vim-signature'
NeoBundle 'bling/vim-airline'
NeoBundle 'edkolev/tmuxline.vim'
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
NeoBundleLazy 'mileszs/ack.vim', {'autoload':{'commands':'Ack'}}
NeoBundleLazy 'rking/ag.vim', {'autoload':{'commands':'Ag'}}
NeoBundle 'luan/vipe', {
  \   'build' : {
  \     'mac' : 'ln -s `pwd`/vipe /usr/local/bin || echo',
  \     'unix' : 'ln -s `pwd`/vipe ~/bin || echo',
  \    },
  \ }

NeoBundle 'milkypostman/vim-togglelist'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'maxbrunsfeld/vim-emacs-bindings'
NeoBundle 'mbbill/undotree'

" Automatic Helpers
" Adds 'end' properly
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'Shougo/neocomplcache.vim'

" MatchIt
NeoBundle 'matchit.zip'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'lucapette/vim-textobj-underscore'
NeoBundle 'nelstrom/vim-textobj-rubyblock'

" Snippets
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'

" Language Additions
" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'ecomba/vim-ruby-refactoring'
" Clojure
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'tpope/vim-fireplace'
" Scala
NeoBundle 'derekwyatt/vim-scala'

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
