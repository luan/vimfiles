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
NeoBundle 'kien/ctrlp.vim', { 'depends': 'tacahiroy/ctrlp-funky' }
NeoBundle 'scrooloose/nerdtree'

" UI Additions
" colorschemes
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'kshenoy/vim-signature'
NeoBundle 'Yggdroot/indentLine'

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
NeoBundle 'luan/vipe', {
  \   'build' : {
  \     'mac' : 'ln -s `pwd`/vipe /usr/local/bin',
  \     'unix' : 'ln -s `pwd`/vipe ~/bin',
  \    },
  \ }
  

NeoBundleLazy 'benmills/vimux', {'autoload':{'commands':'Vimux'}}
NeoBundle 'milkypostman/vim-togglelist'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'maxbrunsfeld/vim-emacs-bindings'

" Automatic Helpers
" Adds 'end' properly
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'scrooloose/syntastic'

" MatchIt
NeoBundle 'matchit.zip'
NeoBundleDepends 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'lucapette/vim-textobj-underscore'
NeoBundle 'nelstrom/vim-textobj-rubyblock'

" Snippets
NeoBundle 'honza/vim-snippets'
NeoBundleLazy 'Shougo/neocomplcache.vim', {'autoload':{'insert':1}}

" Language Additions
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'ecomba/vim-ruby-refactoring'

"   JavaScript
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'maksimr/vim-jsbeautify', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'leafgarland/typescript-vim', {'autoload':{'filetypes':['typescript']}}
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffee']}}
NeoBundleLazy 'mmalecki/vim-node.js', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript','coffee','ls','typescript']}}

"   CSS / HTML
NeoBundleLazy 'tpope/vim-haml', {'autoload':{'filetypes':['haml']}}
NeoBundleLazy 'nono/vim-handlebars', {'autoload':{'filetypes':['handlebars']}}
NeoBundleLazy 'groenewege/vim-less', {'autoload':{'filetypes':['less']}}
NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload':{'filetypes':['scss','sass']}}
NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','scss','sass']}}
NeoBundleLazy 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
NeoBundleLazy 'wavded/vim-stylus', {'autoload':{'filetypes':['styl']}}
NeoBundleLazy 'digitaltoad/vim-jade', {'autoload':{'filetypes':['jade']}}
NeoBundleLazy 'juvenn/mustache.vim', {'autoload':{'filetypes':['mustache']}}
NeoBundleLazy 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}

NeoBundleCheck
