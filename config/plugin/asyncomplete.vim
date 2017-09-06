inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <expr><silent> <CR> <SID>my_cr_function()

imap <M-space> <Plug>(asyncomplete_force_refresh)

augroup luan_asyncomplete
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

  " buffer
  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
        \ 'name': 'buffer',
        \ 'whitelist': ['*'],
        \ 'blacklist': ['go'],
        \ 'completor': function('asyncomplete#sources#buffer#completor'),
        \ }))

  " omni
  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
        \ 'name': 'omni',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#omni#completor')
        \  }))

  " golang
  let g:go_bin_path = resolve(expand('<sfile>:h') . '/../../gobin')
  let $PATH .= ':' . g:go_bin_path

  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
        \ 'name': 'gocode',
        \ 'whitelist': ['go'],
        \ 'completor': function('asyncomplete#sources#gocode#completor'),
        \ 'config': {
        \    'gocode_path': g:go_bin_path . '/gocode'
        \  },
        \ }))

  " rust
  autocmd User asyncomplete_setup call asyncomplete#register_source(
        \ asyncomplete#sources#racer#get_source_options({
        \     'name': 'racer',
        \     'whitelist': ['rust'],
        \     'completor': function('asyncomplete#sources#racer#completor')
        \ }))

  " viml
  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
        \ 'name': 'necovim',
        \ 'whitelist': ['vim'],
        \ 'completor': function('asyncomplete#sources#necovim#completor'),
        \ }))

  if has('python3')
    autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
          \ 'name': 'ultisnips',
          \ 'whitelist': ['*'],
          \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
          \ }))
  endif

  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
        \ 'name': 'tags',
        \ 'whitelist': ['c'],
        \ 'completor': function('asyncomplete#sources#tags#completor'),
        \ 'config': {
        \    'max_file_size': 20000000,
        \  },
        \ }))
augroup END
