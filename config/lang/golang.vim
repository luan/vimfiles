autocmd FileType go compiler go
autocmd! BufEnter *.go setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab

" vim-go setup
if has('nvim')
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
  let g:go_fmt_fail_silently = 1
else
  let g:go_highlight_functions = 0
  let g:go_highlight_methods = 0
  let g:go_highlight_structs = 0
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
endif

let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "neosnippet"
let g:go_fmt_autosave = 1
let g:go_bin_path = resolve(expand('<sfile>:h') . '/../../gobin')

if has('nvim')
  let g:neomake_go_gometalinter_maker = {
        \ 'exe': 'gometalinter',
        \ 'args': [
          \ '-t',
          \ '--disable-all',
          \ '--enable=vet',
          \ '--enable=deadcode',
          \ '--enable=errcheck'
        \],
        \ 'append_file': 0,
        \ 'errorformat':
          \ '%f:%l:%c:%trror: %m,' .
          \ '%f:%l:%c:%tarning: %m,' .
          \ '%f:%l::%trror: %m,' .
          \ '%f:%l::%tarning: %m'
        \ }
  let g:neomake_go_enabled_makers = ['go', 'gometalinter']
else
  let g:syntastic_go_gometalinter_args = '-t --disable-all -E vet -E deadcode'
  let g:syntastic_go_checkers = ['go', 'gometalinter']
end


function! golang#generate_project()
  call system('find . -iname "*.go" > /tmp/gotags-filelist-project')
  let gopath = substitute(system('go env GOPATH'), '\n', '', '')
  call vimproc#system_bg('gotags -silent -L /tmp/gotags-filelist-project > ' . gopath . '/tags')
endfunction

function! golang#generate_global()
  call system('find `go env GOROOT GOPATH` -iname "*.go" > /tmp/gotags-filelist-global')
  let gopath = substitute(system('go env GOPATH'), '\n', '', '')
  call vimproc#system_bg('gotags -silent -L /tmp/gotags-filelist-global > ' . gopath . '/tags')
endfunction

function! golang#buffcommands()
  command! -buffer -bar -nargs=0 GoTags call golang#generate_project()
  command! -buffer -bar -nargs=0 GoTagsGlobal call golang#generate_global()
  setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
endfunction

let s:projections = {
      \ '*': {},
      \ '*.go': {'type': 'go', 'alternate': ['{}_test.go']},
      \ '*_suite_test.go': {'type': 'suite'},
      \ '*_test.go': {
      \   'type': 'test',
      \   'alternate': '{}.go'}}

function! s:ProjectionistDetect() abort
  if &ft=='go'
    let projections = deepcopy(s:projections)
    call projectionist#append(getcwd(), projections)
  endif
endfunction

augroup go_projectionist
  autocmd!
  autocmd User ProjectionistDetect call s:ProjectionistDetect()
augroup END

if exists("g:disable_gotags_on_save") && g:disable_gotags_on_save
  augroup go_gotags
    autocmd!
    autocmd BufWritePost *.go call golang#generate_project()
    autocmd BufWritePost *.go call golang#generate_global()
  augroup END
endif

augroup golang
  autocmd FileType go compiler go
  autocmd! BufEnter *.go call golang#buffcommands()
augroup END

