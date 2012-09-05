" =======================================
" Initially based on/forked from: Jeremy Mack (@mutewinter) [http://github.com/mutewinter/dot_vim]
" Who: Luan Santos (@cfcluan)
" What: .vimrc of champions
" Version: 1.0 (this may never change because who versions dot files,
" honestly)
" =======================================

set nocompatible
runtime! Vundle.before.vim
runtime! Vundle.vim

runtime! config/platform.vim
runtime! config/basic.vim
runtime! config/bindings.vim

" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

runtime! config/plugin/SuperTab.vim
runtime! config/plugin/Neocachecompl.vim
runtime! config/plugin/NERDTree.vim
runtime! config/plugin/NERDCommenter.vim
runtime! config/plugin/Tabular.vim
runtime! config/plugin/Fugitive.vim
runtime! config/plugin/CommandT.vim
runtime! config/plugin/Powerline.vim
runtime! config/plugin/Ack.vim
runtime! config/plugin/Vundle.vim

" ----------------------------------------
" Lib load path
" ----------------------------------------

runtime! lib/functions.vim
runtime! lib/AutoCommands.vim

