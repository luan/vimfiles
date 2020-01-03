call plug#begin('~/.vim/plugged')

" Defaults {{{
Plug 'tpope/vim-sensible'
" }}}

" Navigation {{{
" Displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" combine with netrw to create a delicious salad dressing
Plug 'tpope/vim-vinegar'

" project configuration via 'projections'
Plug 'tpope/vim-projectionist'

" A command-line fuzzy finder written in Go
let g:fzf_command_prefix = 'FZF'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Active fork of kien/ctrlp.vim. Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'
" }}}

" UI Additions {{{
" Colors {{{
Plug 'dolio/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'
Plug 'ayu-theme/ayu-vim'
" }}}

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Show a diff via Vim sign column.
Plug 'mhinz/vim-signify'

" Plugin to toggle, display and navigate marks
Plug 'kshenoy/vim-signature'

" Better whitespace highlighting for Vim
Plug 'ntpeters/vim-better-whitespace'

" Toggle the cursor shape in the terminal for Vim.
Plug 'jszakmeister/vim-togglecursor'
" }}}

" Commands {{{
function! InstallVipe(info)
  if a:info.status ==# 'installed' || a:info.force
    if has('unix')
      let s:uname = system('uname -s')
      if s:uname =~? 'Darwin'
        silent !rm -f /usr/local/bin/vipe
        silent !ln -s `pwd`/vipe /usr/local/bin || true
      else
        silent !ln -s `pwd`/vipe ~/bin || true
      endif
    endif
  endif
endfunction

function! InstallVimProc(info)
  if a:info.status ==# 'installed' || a:info.force
    if has('unix')
      let s:uname = system('uname -s')
      if s:uname =~? 'Darwin'
        silent !make -f make_mac.mak
      elseif s:uname =~? 'Linux'
        silent !make
      else
        silent !gmake
      endif
    elseif has('win32unix')
      silent !make -f make_cygwin.mak
    elseif has('win32')
      silent !tools\update-dll-mingw
    endif
  endif
endfunction

" asynchronous process manager; run :VimProcBang to run a command and echo the results
Plug 'Shougo/vimproc.vim', { 'do': function('InstallVimProc') }

" comment stuff out (via leader-/)
Plug 'tomtom/tcomment_vim'

" quoting/parenthesizing made simple; e.g. ysiw) to wrap word in parens
Plug 'tpope/vim-surround'

" a Git wrapper so awesome, it should be illegal; :Gblame, etc
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" Vim sugar for the UNIX shell commands that need it the most; e.g. :Find, :Wall
Plug 'tpope/vim-eunuch'

" Run a command over every entry in the quickfix list (:Cdo) or location list (:Ldo).
Plug 'Peeja/vim-cdo'

" Vim script for text filtering and alignment; e.g. :Tabularize /,
Plug 'godlygeek/tabular'

" Vim plugin for the Perl module / CLI script 'ack'
Plug 'mileszs/ack.vim'

" Send test commands to a pipe.
Plug 'luan/vipe', { 'do': function('InstallVipe') }

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" Functions to toggle the [Location List] and the [Quickfix List] windows.
Plug 'milkypostman/vim-togglelist'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" Add emacs/bash/cocoa key bindings to vim, in insert and command-line modes.
Plug 'maxbrunsfeld/vim-emacs-bindings'

" The ultimate undo history visualizer for VIM
Plug 'mbbill/undotree'

" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'

" All the world's indeed a stage and we are merely players
Plug 'junegunn/limelight.vim'

" Make ^a and ^x work properly with dates
Plug 'tpope/vim-speeddating'
" }}}

" Automatic Helpers {{{
" wisely add "end" in ruby, endfunction/endif/more in vim script, etc
Plug 'tpope/vim-endwise'

" enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'

" automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
Plug 'tpope/vim-sleuth'

" pairs of handy bracket mappings; e.g. [<Space> and ]<Space> add newlines before and after the cursor line
Plug 'tpope/vim-unimpaired'

" Reorder delimited items
Plug 'machakann/vim-swap'

" Simplifies the transition between multiline and single-line code
Plug 'AndrewRadev/splitjoin.vim'

" Dark powered asynchronous completion framework for neovim/Vim8
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-clang' " C/C++
Plug 'zchee/deoplete-go' " Golang
Plug 'sebastianmarkow/deoplete-rust' " Rust
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } " Javascript
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
let g:deoplete#enable_at_startup = 1

" Clang based syntax highlighting for Neovim
Plug 'arakashic/chromatica.nvim'

if !has('nvim') || $ALL_PLUGINS ==# 'true'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Provide easy code formatting in Vim by integrating existing code formatters.
Plug 'Chiel92/vim-autoformat'

" displays information in echo area from echodoc plugin.
Plug 'Shougo/echodoc.vim'

" Make Vim persist editing state without fuss
Plug 'kopischke/vim-stay'

" Make Vim handle line and column numbers in file names with a minimum of fuss
Plug 'kopischke/vim-fetch'

" Speed up Vim by updating folds only when called-for.
Plug 'Konfekt/FastFold'
" }}}

" Text objects {{{
" allows you to configure % to match more than just single characters
Plug 'vim-scripts/matchit.zip'

" Create your own text objects
Plug 'kana/vim-textobj-user'

" Underscore text-object for Vim
Plug 'lucapette/vim-textobj-underscore'

" custom text object for selecting ruby blocks
Plug 'nelstrom/vim-textobj-rubyblock'

" A convenient text object for last pasted text
Plug 'saaguero/vim-textobj-pastedtext'

"Text objects for functions
Plug 'kana/vim-textobj-function'

" A Vim text object for ERB blocks.
Plug 'whatyouhide/vim-textobj-erb'

" Vim plugin that provides additional text objects
Plug 'wellle/targets.vim'

" Text objects for foldings
Plug 'kana/vim-textobj-fold'
" }}}'

" Snippets {{{
"UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
if has('python') || has('python3')
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
endif
" }}}

" Language specific {{{
" Ruby {{{
Plug 'tpope/vim-rails', { 'for': ['ruby', 'rake'] }
Plug 'tpope/vim-rake', { 'for': ['ruby', 'rake'] }
Plug 'tpope/vim-bundler', { 'for': ['ruby', 'rake'] }
Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby', 'rake'] }
Plug 'tpope/vim-cucumber', { 'for': ['cucumber'] }
" }}}

" Clojure {{{
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
" }}}

" Go {{{
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" }}}

" Markdown {{{
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'shime/vim-livedown', { 'for': 'markdown' }
" }}}

" JavaScript {{{
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'mxw/vim-jsx'
" }}}

" TypeScript {{{
Plug 'leafgarland/typescript-vim'
" }}}

" Vue {{{
Plug 'posva/vim-vue', { 'for': 'vue' }
" }}}

" CSS / HTML {{{
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'gregsexton/MatchTag'
" }}}

" VimL {{{
Plug 'ynkdir/vim-vimlparser', { 'for': 'vim' }
Plug 'syngan/vim-vimlint', { 'for': 'vim' }
" }}}

" Fish {{{
Plug 'dag/vim-fish', { 'for': 'fish' }
" }}}

" Elm {{{
Plug 'elmcast/elm-vim', { 'for': 'elm' }
" }}}

" Rust {{{
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" }}}

" Misc {{{
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'keith/tmux.vim'
Plug 'kurayama/systemd-vim-syntax'
Plug 'iloginow/vim-stylus'
Plug 'chr4/nginx.vim'
Plug 'uarun/vim-protobuf'
Plug 'peterhoeg/vim-qml'
Plug 'keith/rspec.vim'
Plug 'hashivim/vim-terraform'
Plug 'PProvost/vim-ps1'
Plug 'ciaranm/securemodelines' " Secure modeline https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
Plug 'jceb/vim-orgmode'
" }}}
" }}}

source $HOME/.vimrc.local.plugins

call plug#end()

