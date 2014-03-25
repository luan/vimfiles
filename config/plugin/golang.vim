let gofmt_command='goimports'
let g:syntastic_go_checkers=['go', 'govet']

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
  command! -buffer -bar -nargs=0 Gotags call golang#generate_project()
  command! -buffer -bar -nargs=0 GotagsGlobal call golang#generate_global()
endfunction

