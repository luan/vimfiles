call plug#begin('~/.vim/plugged')

" Defaults {{{
" }}}

" Navigation {{{
  Plug 'bogado/file-line'
  Plug 'junegunn/fzf', { 'do': 'yes \| ./install'  }
  if !has('nvim')
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'FelikZ/ctrlp-py-matcher'
  endif
" }}}

" UI Additions {{{
" }}}

" Commands {{{
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  if has('nvim')
    Plug 'benekastah/neomake'
  else
    Plug 'scrooloose/syntastic'
  endif
  Plug 'mbbill/undotree'
  Plug 'google/vim-maktaba'
  Plug 'google/vim-codefmt'
  Plug 'google/vim-glaive'
" }}}

" Automatic Helpers {{{
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-unimpaired'

  if has('nvim')
    Plug 'Shougo/deoplete.nvim'
  elseif !(has('lua') && (v:version > 703 || v:version == 703 && has('patch885')))
    Plug 'Shougo/neocomplcache.vim'
  else
    Plug 'Shougo/neocomplete.vim'
  endif
  Plug 'Shougo/echodoc.vim'
" }}}

" Text objects {{{
  Plug 'matchit.zip'
  Plug 'kana/vim-textobj-user'
  Plug 'lucapette/vim-textobj-underscore'
  Plug 'nelstrom/vim-textobj-rubyblock'
" }}}

" Language specific {{{
  " Ruby {{{
    Plug 'vim-ruby/vim-ruby',           { 'for': ['ruby', 'rake'] }
    Plug 'tpope/vim-rails',             { 'for': ['ruby', 'rake'] }
    Plug 'tpope/vim-rake',              { 'for': ['ruby', 'rake'] }
    Plug 'tpope/vim-bundler',           { 'for': ['ruby', 'rake'] }
    Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby', 'rake'] }
    Plug 'tpope/vim-cucumber',          { 'for': ['cucumber']     }
  " }}}

  " Clojure {{{
    Plug 'guns/vim-clojure-static', { 'for': ['clojure'] }
    Plug 'tpope/vim-classpath'
    Plug 'tpope/vim-fireplace',     { 'for': ['clojure'] }
    Plug 'tpope/vim-salve'
    Plug 'guns/vim-sexp'
    Plug 'tpope/vim-sexp-mappings-for-regular-people'
  " }}}

  " Scala {{{
    Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
  " }}}

  " Go {{{
    Plug 'fatih/vim-go'
  " }}}

  " Docker {{{
    Plug 'honza/dockerfile.vim'
  " }}}

  " JavaScript {{{
    Plug 'pangloss/vim-javascript',  { 'for': ['javascript']        }
    Plug 'mxw/vim-jsx',              { 'for': ['javascript']        }
    Plug 'maksimr/vim-jsbeautify',   { 'for': ['javascript']        }
    Plug 'kchmck/vim-coffee-script', { 'for': ['coffee']            }
    Plug 'elzr/vim-json',            { 'for': ['javascript','json'] }
  " }}}

  " CSS / HTML {{{
    Plug 'mattn/emmet-vim'
    Plug 'tpope/vim-haml',            { 'for': ['haml']              }
    Plug 'nono/vim-handlebars',       { 'for': ['handlebars']        }
    Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss','sass']       }
    Plug 'hail2u/vim-css3-syntax',    { 'for': ['css','scss','sass'] }
    Plug 'othree/html5.vim',
    Plug 'juvenn/mustache.vim',       { 'for': ['mustache']          }
    Plug 'gregsexton/MatchTag',
  " }}}

  " VimL {{{
    Plug 'ynkdir/vim-vimlparser', { 'for': 'vim' }
    Plug 'syngan/vim-vimlint',    { 'for': 'vim' }
  " }}}
  
  " Elixir {{{
    Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
  " }}}
" }}}

source $HOME/.vimrc.local.plugins

call plug#end()

if has('nvim')
  call maktaba#json#python#Disable()
endif

try
  call glaive#Install()
catch
endtry

