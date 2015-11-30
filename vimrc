" =======================================
" Initially based on/forked from: Jeremy Mack (@mutewinter)
" [http://github.com/luan/vimfiles]
" Maintained By: Luan Santos (GitHub: @luan)
" =======================================

if !has('nvim')
  set nocompatible
endif

runtime! Plug.vim

silent! source ~/.vimrc.local.before

runtime! config/basic.vim
runtime! config/bindings.vim
runtime! config/colors.vim
runtime! config/paste.vim

" Platform Specific
runtime! config/platform.vim

" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

runtime! config/plugin/NERDTree.vim
runtime! config/plugin/ack.vim
runtime! config/plugin/airline.vim
runtime! config/plugin/autoclose.vim
runtime! config/plugin/commentary.vim
runtime! config/plugin/echodoc.vim
runtime! config/plugin/fugitive.vim
runtime! config/plugin/gitrebase.vim
runtime! config/plugin/golang.vim
runtime! config/plugin/rust.vim
runtime! config/plugin/json.vim
runtime! config/plugin/multicursor.vim
runtime! config/plugin/neosnippet.vim
runtime! config/plugin/omnicompletion.vim
runtime! config/plugin/rainbow.vim
runtime! config/plugin/signify.vim
runtime! config/plugin/syntastic.vim
runtime! config/plugin/tagbar.vim
runtime! config/plugin/undotree.vim
runtime! config/plugin/yaml.vim

if has('nvim')
  runtime! config/plugin/fzf.vim
  runtime! config/plugin/nvim/neomake.vim
  runtime! config/plugin/nvim/deoplete.vim
else
  runtime! config/plugin/ctrlp.vim
  runtime! config/plugin/neocomplete.vim
endif

" ----------------------------------------
" Lib load path
" ----------------------------------------

runtime! lib/functions.vim
runtime! lib/auto_commands.vim

silent! source ~/.vimrc.local

