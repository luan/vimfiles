" =======================================
" Initially based on/forked from: Jeremy Mack (@mutewinter)
" [http://github.com/mutewinter/dot_vim]
" Who: Luan Santos (@cfcluan)
" What: .vimrc of champions
" Version: 2.0
" =======================================

set nocompatible
runtime! NeoBundle.vim

silent! source ~/.vimrc.local.before

runtime! config/basic.vim
runtime! config/bindings.vim
runtime! config/colors.vim

" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

runtime! config/plugin/airline.vim
runtime! config/plugin/NERDTree.vim
runtime! config/plugin/ctrlp.vim
runtime! config/plugin/indentLine.vim
runtime! config/plugin/neocomplcache.vim
runtime! config/plugin/neosnippet.vim
runtime! config/plugin/syntastic.vim

" ----------------------------------------
" Lib load path
" ----------------------------------------

runtime! lib/functions.vim
runtime! lib/AutoCommands.vim

" Platform Specific
runtime! config/platform.vim

silent! source ~/.vimrc.local

