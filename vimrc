" =======================================
" Initially based on/forked from: Jeremy Mack (@mutewinter)
" [http://github.com/mutewinter/dot_vim]
" Who: Luan Santos (@cfcluan)
" What: .vimrc of champions
" Version: 2.0
" =======================================

set nocompatible
runtime! Vundle.vim

runtime! config/platform.vim
runtime! config/basic.vim
runtime! config/bindings.vim

" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

runtime! config/plugin/Ack.vim
runtime! config/plugin/CommandT.vim
runtime! config/plugin/Neocachecompl.vim
runtime! config/plugin/NERDTree.vim
runtime! config/plugin/Powerline.vim
runtime! config/plugin/SuperTab.vim
runtime! config/plugin/Tabular.vim
runtime! config/plugin/Vundle.vim

" ----------------------------------------
" Lib load path
" ----------------------------------------

runtime! lib/functions.vim
runtime! lib/AutoCommands.vim

