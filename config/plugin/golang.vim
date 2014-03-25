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

function! golang#alternate(...)
  let cmd = ''

  if a:0 == 0
    let cmd .= "find "
  elseif a:1 == 'V'
    let cmd .= "vert sfind "
  elseif a:1 == 'S'
    let cmd .= "sfind "
  elseif a:1 == 'T'
    let cmd .= "tabfind "
  endif

  if stridx(expand("%:t"), "_test.go") > 0
    exe cmd . substitute(expand("%:p"), "_test\.go$", ".go", "g")
  elseif stridx(expand("%:t"), ".go") > 0
    exe cmd . substitute(expand("%:p"), "\.go$", "_test.go", "g")
  else
    echo "Not in a go file"
  endif
endfunction

function! golang#buffcommands()
  command! -buffer -bar -nargs=0 A call golang#alternate()
  command! -buffer -bar -nargs=0 AV call golang#alternate('V')
  command! -buffer -bar -nargs=0 AS call golang#alternate('S')
  command! -buffer -bar -nargs=0 AT call golang#alternate('T')
  command! -buffer -bar -nargs=0 Gotags call golang#generate_project()
  command! -buffer -bar -nargs=0 GotagsGlobal call golang#generate_global()
endfunction

