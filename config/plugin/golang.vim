let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_structs = 0
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_snippet_engine = "neosnippet"
let g:go_fmt_autosave = 0

try
Glaive codefmt gofmt_executable='goimports'
catch
endtry

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

augroup go_autoformat
  autocmd!
  autocmd BufEnter *.go execute(':AutoFormatBuffer')
augroup END


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
