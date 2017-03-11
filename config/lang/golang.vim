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
let g:go_highlight_types = 0

let g:go_snippet_engine = "ultisnips"

let g:go_bin_path = resolve(expand('<sfile>:h') . '/../../gobin')

let g:go_auto_type_info = 0

let g:gomakeprg =
      \ 'go test -o /tmp/vim-go-test -c ./%:h && ' .
      \ '! PATH=' . g:go_bin_path . ':' . $PATH . ' gometalinter ' .
      \ '--tests ' .
      \ '--disable-all ' .
      \ '--enable=vet ' .
      \ '--enable=deadcode ' .
      \ '--enable=errcheck ' .
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
autocmd BufEnter *.go let &makeprg = gomakeprg
autocmd BufEnter *.go let &errorformat = goerrorformat
autocmd! BufWritePost *.go Neomake!
let g:neomake_go_enabled_makers = []

if has('nvim')
  let g:deoplete#sources#go#gocode_binary	= g:go_bin_path . '/gocode'
  let g:deoplete#sources#go#align_class = 1
endif

function! golang#generate_project()
  call system('find . -iname "*.go" > /tmp/gotags-filelist-project')
  let gopath = substitute(system('go env GOPATH'), '\n', '', '')
  call vimproc#system_bg(g:go_bin_path . '/gotags -silent -L /tmp/gotags-filelist-project > ' . gopath . '/tags')
endfunction

function! golang#generate_global()
  call system('find `go env GOROOT GOPATH` -iname "*.go" > /tmp/gotags-filelist-global')
  let gopath = substitute(system('go env GOPATH'), '\n', '', '')
  call vimproc#system_bg(g:go_bin_path . '/gotags -silent -L /tmp/gotags-filelist-global > ' . gopath . '/tags')
endfunction

function! golang#buffcommands()
  command! -buffer -bar -nargs=0 GoTags call golang#generate_project()
  command! -buffer -bar -nargs=0 GoTagsGlobal call golang#generate_global()
  setlocal foldmethod=syntax shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
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

