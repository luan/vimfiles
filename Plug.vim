call plug#begin('~/.vim/plugged')

" Defaults {{{
  Plug 'tpope/vim-sensible'
" }}}

" Navigation {{{
  " Displays tags in a window, ordered by scope
  Plug 'majutsushi/tagbar'

  " A tree explorer plugin for vim
  Plug 'scrooloose/nerdtree'

  " project configuration via 'projections'
  Plug 'tpope/vim-projectionist'

  " A command-line fuzzy finder written in Go
  let g:fzf_command_prefix = 'FZF'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'


  " Active fork of kien/ctrlp.vim. Fuzzy file, buffer, mru, tag, etc finder.
  Plug 'ctrlpvim/ctrlp.vim'

  " Fast vim CtrlP matcher based on python
  Plug 'FelikZ/ctrlp-py-matcher'
" }}}

" UI Additions {{{
  " Colors {{{
    Plug 'dolio/vim-hybrid'
    Plug 'morhetz/gruvbox'
    Plug 'chriskempson/base16-vim'
    Plug 'flazz/vim-colorschemes'
  " }}}

  " rainbow parentheses improved, shorter code, no level limit, smooth and fast, powerful configuration.
  Plug 'luochen1990/rainbow'

  " lean & mean status/tabline for vim that's light as air
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Plugin to toggle, display and navigate marks
  Plug 'kshenoy/vim-signature'

  " Show a diff via Vim sign column.
  Plug 'mhinz/vim-signify'

  " Seamless navigation between tmux panes and vim splits
  Plug 'christoomey/vim-tmux-navigator'

  " Better whitespace highlighting for Vim
  Plug 'ntpeters/vim-better-whitespace'

  " Toggle the cursor shape in the terminal for Vim.
  Plug 'jszakmeister/vim-togglecursor'
" }}}

" Commands {{{
  function! InstallVipe(info)
    if a:info.status == 'installed' || a:info.force
      if has("unix")
        let s:uname = system("uname -s")
        if s:uname =~ "Darwin"
          silent !rm -f /usr/local/bin/vipe
          silent !ln -s `pwd`/vipe /usr/local/bin || true
        else
          silent !ln -s `pwd`/vipe ~/bin || true
        endif
      endif
    endif
  endfunction

  function! InstallVimProc(info)
    if a:info.status == 'installed' || a:info.force
      if has("unix")
        let s:uname = system("uname -s")
        if s:uname =~ "Darwin"
          silent !make -f make_mac.mak
        elseif s:uname =~ "Linux"
          silent !make
        else
          silent !gmake
        endif
      elseif has("win32unix")
        silent !make -f make_cygwin.mak
      elseif has('win32')
        silent !tools\update-dll-mingw
      endif
    endif
  endfunction

  " asynchronous process manager; run :VimProcBang to run a command and echo the results
  Plug 'Shougo/vimproc.vim', { 'do': function('InstallVimProc') }

  " comment stuff out (via leader-/)
  Plug 'tpope/vim-commentary'

  " quoting/parenthesizing made simple; e.g. ysiw) to wrap word in parens
  Plug 'tpope/vim-surround'

  " a Git wrapper so awesome, it should be illegal; :Gblame, etc
  Plug 'tpope/vim-fugitive'

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

  " Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module / CLI script 'ack'
  Plug 'rking/ag.vim'

  " Send test commands to a pipe.
  Plug 'luan/vipe', { 'do': function('InstallVipe') }

  " asynchronous build and test dispatcher
  Plug 'tpope/vim-dispatch'

  " Syntax checking hacks for vim
  if $ALL_PLUGINS == 'true' || has('nvim')
    Plug 'benekastah/neomake'
  endif
  if $ALL_PLUGINS == 'true' || !has('nvim')
    Plug 'scrooloose/syntastic'
  endif

  " Functions to toggle the [Location List] and the [Quickfix List] windows.
  Plug 'milkypostman/vim-togglelist'

  " True Sublime Text style multiple selections for Vim
  Plug 'terryma/vim-multiple-cursors'

  " Add emacs/bash/cocoa key bindings to vim, in insert and command-line modes.
  Plug 'maxbrunsfeld/vim-emacs-bindings'

  " The ultimate undo history visualizer for VIM
  Plug 'mbbill/undotree'
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

  if $ALL_PLUGINS == 'true' || has('nvim')
    " provides an asynchronous keyword completion system in the current buffer
    Plug 'Shougo/deoplete.nvim'
    " deoplete.nvim source for Golang and gocode or vim-go
    Plug 'zchee/deoplete-go', { 'do': 'make' }
  endif

  if $ALL_PLUGINS == 'true' || has('lua')
    " Next generation completion framework after neocomplcache
    Plug 'Shougo/neocomplete.vim'
  endif
  " displays information in echo area from echodoc plugin.
  Plug 'Shougo/echodoc.vim'

   " Speed up Vim by updating folds only when called-for.
   let g:fastfold_savehook = 0
   let g:fastfold_fold_command_suffixes = []
   let g:fastfold_fold_movement_commands = []
   Plug 'Konfekt/FastFold'

   " Provide easy code formatting in Vim by integrating existing code formatters.
   Plug 'Chiel92/vim-autoformat'
" }}}

" Text objects {{{
  " allows you to configure % to match more than just single characters
  Plug 'matchit.zip'

  " Create your own text objects
  Plug 'kana/vim-textobj-user'

  " Underscore text-object for Vim
  Plug 'lucapette/vim-textobj-underscore'

  " custom text object for selecting ruby blocks
  Plug 'nelstrom/vim-textobj-rubyblock'
" }}}

" Snippets {{{
  "UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
  if version >= 704
    Plug 'SirVer/ultisnips'
  endif

  " vim-snipmate default snippets (Previously snipmate-snippets)
  Plug 'honza/vim-snippets'
" }}}

" Language specific {{{
  " Ruby {{{
    Plug 'tpope/vim-rails',             { 'for': ['ruby', 'rake'] }
    Plug 'tpope/vim-rake',              { 'for': ['ruby', 'rake'] }
    Plug 'tpope/vim-bundler',           { 'for': ['ruby', 'rake'] }
    Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby', 'rake'] }
    Plug 'tpope/vim-cucumber',          { 'for': ['cucumber']     }
  " }}}

  " Clojure {{{
    Plug 'tpope/vim-classpath'
    Plug 'tpope/vim-fireplace',     { 'for': ['clojure'] }
    Plug 'tpope/vim-salve'
    Plug 'guns/vim-sexp'
    Plug 'tpope/vim-sexp-mappings-for-regular-people'
  " }}}

  " Go {{{
    Plug 'fatih/vim-go'
    Plug 'godoctor/godoctor.vim'
  " }}}

  " Markdown {{{
    Plug 'shime/vim-livedown', { 'for': ['markdown'] }
  " }}}

  " JavaScript {{{
    Plug 'maksimr/vim-jsbeautify',   { 'for': ['javascript']        }
  " }}}

  " CSS / HTML {{{
    Plug 'mattn/emmet-vim'
    Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss','sass']       }
    Plug 'hail2u/vim-css3-syntax',    { 'for': ['css','scss','sass'] }
    Plug 'gregsexton/MatchTag'
  " }}}

  " VimL {{{
    Plug 'ynkdir/vim-vimlparser', { 'for': 'vim' }
    Plug 'syngan/vim-vimlint',    { 'for': 'vim' }
  " }}}

  " Fish {{{
    Plug 'dag/vim-fish', { 'for': 'fish' }
  " }}}

  " Elm {{{
    Plug 'elmcast/elm-vim', { 'for': 'elm' }
  " }}}

  " Go {{{
    Plug 'rust-lang/rust.vim'
  " }}}

  " Concourse {{{
    Plug 'luan/vim-concourse'
  " }}}

  " A solid language pack for Vim.
  " Adds 70+ languages and optimizes loading and installing.
  Plug 'sheerun/vim-polyglot'
" }}}

" vim interface to Web API
Plug 'mattn/webapi-vim'

source $HOME/.vimrc.local.plugins

call plug#end()

