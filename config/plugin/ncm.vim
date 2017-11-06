if !has('python3')
  au VimEnter *
      \ echohl Error | echomsg '[vimfiles] cannot setup autocomplete, install vim with python3 or try neovim' | echohl None
  finish
endif

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

