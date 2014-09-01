function! golang#generate_project()
  echo "Generating 'gotags' for project..."
  call system("find . -iname \"*.go\" | gotags -silent -L - > tags")
  echo "'gotags' generated!"
endfunction

function! golang#generate_global()
  echo "Generating global 'gotags', this may take a while..."
  call system("find `go env GOROOT GOPATH` -iname \"*.go\" | gotags -silent -L - > `go env GOPATH`/tags")
  echo "'gotags' generated!"
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

