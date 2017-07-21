autocmd FileType go compiler go
autocmd! BufEnter *.go setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab

" vim-go setup
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

" this breaks folding on vim < 8.0 or neovim
if v:version >= 800 || has('nvim')
  let g:go_fmt_experimental = 1
endif

let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_snippet_engine = 'ultisnips'

let g:go_bin_path = resolve(expand('<sfile>:h') . '/../../gobin')
let $PATH .= ':' . g:go_bin_path

let g:go_auto_type_info = 0

let g:ale_go_gometalinter_options =
      \ '--tests ' .
      \ '--fast ' .
      \ '--exclude="should have comment" ' .
      \ '--exclude="error return value not checked \(defer"'

if has('nvim')
  let g:deoplete#sources#go#gocode_binary	= g:go_bin_path . '/gocode'
  let g:deoplete#sources#go#align_class = 1
endif

function! golang#generate_project()
  call vimproc#system_bg("bash -c '" . g:go_bin_path . "/gotags -silent -L <(find . -iname '*.go') > ./tags'")
endfunction

function! golang#generate_global()
  call vimproc#system_bg("bash -c '" . g:go_bin_path . "/gotags -silent -L <(find $(go env GOROOT GOPATH) -iname '*.go') > $GOPATH/tags'")
endfunction

function! golang#buffcommands()
  command! -buffer -bar -nargs=0 GoTags call golang#generate_project()
  command! -buffer -bar -nargs=0 GoTagsGlobal call golang#generate_global()
  setlocal foldmethod=syntax shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
endfunction

augroup go
  autocmd!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END

augroup go_gotags
  autocmd!
  autocmd BufWritePost *.go call golang#generate_project()
  autocmd BufWritePost *.go call golang#generate_global()
augroup END

augroup golang
  autocmd FileType go compiler go
  autocmd! BufEnter *.go call golang#buffcommands()
augroup END

