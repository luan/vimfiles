autocmd FileType go compiler go
autocmd! BufEnter *.go setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab

" autocomplete on just about any character
if has('nvim')
  let g:deoplete#omni_patterns.go = '[a-zA-Z_\.]'
endif

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
let g:go_fmt_autosave = 0

try
Glaive codefmt gofmt_executable='goimports'
catch
endtry

augroup go_autoformat
  autocmd!
  autocmd BufEnter *.go execute(':AutoFormatBuffer')
augroup END

if has('nvim')
  " run go test first to catch errors in tests and code, and then gometalinter
  let g:gomakeprg =
        \ 'go test -o /tmp/vim-go-test -c ./%:h && ' .
        \ '! gometalinter ' .
        \ '--disable=gofmt ' .
        \ '--disable=dupl ' .
        \ '--tests ' .
        \ '--fast ' .
        \ '--sort=severity ' .
        \ '--exclude "should have comment" ' .
        \ '| grep "%"'

  " match gometalinter + go test output
  let g:goerrorformat =
        \ '%f:%l:%c:%t%*[^:]:\ %m,' .
        \ '%f:%l::%t%*[^:]:\ %m,' .
        \ '%W%f:%l: warning: %m,' .
        \ '%E%f:%l:%c:%m,' .
        \ '%E%f:%l:%m,' .
        \ '%C%\s%\+%m,' .
        \ '%-G#%.%#'

  " wire in Neomake
  autocmd BufEnter *.go let &makeprg = g:gomakeprg
  autocmd BufEnter *.go let &errorformat = g:goerrorformat
  autocmd! BufWritePost *.go Neomake!
endif

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

" if exists("g:disable_gotags_on_save") && g:disable_gotags_on_save
"   augroup go_gotags
"     autocmd!
"     autocmd BufWritePost *.go call golang#generate_project()
"     autocmd BufWritePost *.go call golang#generate_global()
"   augroup END
" endif
