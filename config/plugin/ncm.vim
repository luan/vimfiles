if !has('python3')
  augroup luan_ncm
    autocmd!
    autocmd VimEnter *
          \ echohl Error | echomsg '[vimfiles] cannot setup autocomplete, install vim with python3 or try neovim' | echohl None
    finish
  augroup END
endif

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

