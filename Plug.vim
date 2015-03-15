call plug#begin('~/.vim/plugged')

" Defaults {{{
  Plug 'tpope/vim-sensible'
" }}}

" Navigation {{{
  Plug 'junegunn/fzf', { 'do': 'yes \| ./install'  }
  Plug 'kien/ctrlp.vim'
  Plug 'FelikZ/ctrlp-py-matcher'
  Plug 'majutsushi/tagbar'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-projectionist'
" }}}

" UI Additions {{{
  " Colors {{{
    Plug 'dolio/vim-hybrid'
    Plug 'chriskempson/base16-vim'
  " }}}

  Plug 'luochen1990/rainbow'
  Plug 'bling/vim-airline'
  Plug 'kshenoy/vim-signature'
  Plug 'mhinz/vim-signify'
  Plug 'jszakmeister/vim-togglecursor'
  Plug 'christoomey/vim-tmux-navigator'
" }}}

" Commands {{{
  function! InstallVipe(info)
    if a:info.status == 'installed' || a:info.force
      if has("unix")
        let s:uname = system("uname -s")
        if s:uname == "Darwin"
          !ln -s `pwd`/vipe /usr/local/bin || true
        else
          !ln -s `pwd`/vipe ~/bin || true
        endif
      endif
    endif
  endfunction

  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'gregsexton/gitv',                { 'on': 'Gitv'                  }
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-eunuch'
  Plug 'godlygeek/tabular'
  Plug 'mileszs/ack.vim',                { 'on': 'Ack'                   }
  Plug 'rking/ag.vim',                   { 'on': 'Ag'                    }
  Plug 'luan/vipe',                      { 'do': function('InstallVipe') }
  Plug 'scrooloose/syntastic'
  Plug 'milkypostman/vim-togglelist'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'maxbrunsfeld/vim-emacs-bindings'
  Plug 'mbbill/undotree'
" }}}

" Automatic Helpers {{{
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-unimpaired'
  Plug 'Townk/vim-autoclose', { 'on': 'AutoCloseOn' }

  if !(has('lua') && (v:version > 703 || v:version == 703 && has('patch885')))
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

" Snippets {{{
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
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
    Plug 'tpope/vim-fireplace',     { 'for': ['clojure'] }
  " }}}

  " Scala {{{
    Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
  " }}}

  " Go {{{
    Plug 'fatih/vim-go', { 'for': ['go'] }
  " }}}

  " Docker {{{
    Plug 'honza/dockerfile.vim'
  " }}}

  " JavaScript {{{
    Plug 'pangloss/vim-javascript',  { 'for': ['javascript']        }
    Plug 'mxw/vim-jsx',              { 'for': ['javascript']        }
    Plug 'maksimr/vim-jsbeautify',   { 'for': ['javascript']        }
    Plug 'kchmck/vim-coffee-script', { 'for': ['coffee']            }
    Plug 'leshill/vim-json',         { 'for': ['javascript','json'] }
  " }}}

  " CSS / HTML {{{
    Plug 'mattn/emmet-vim',           { 'for': ['html','css']        }
    Plug 'tpope/vim-haml',            { 'for': ['haml']              }
    Plug 'nono/vim-handlebars',       { 'for': ['handlebars']        }
    Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss','sass']       }
    Plug 'hail2u/vim-css3-syntax',    { 'for': ['css','scss','sass'] }
    Plug 'othree/html5.vim',          { 'for': ['html']              }
    Plug 'juvenn/mustache.vim',       { 'for': ['mustache']          }
    Plug 'gregsexton/MatchTag',       { 'for': ['html','xml']        }
  " }}}

  " VimL {{{
    Plug 'ynkdir/vim-vimlparser', { 'for': 'vim' }
    Plug 'syngan/vim-vimlint',    { 'for': 'vim' }
  " }}}
" }}}

source $HOME/.vimrc.local.plugins

call plug#end()

