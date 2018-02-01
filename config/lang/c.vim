
au FileType cpp setlocal foldmethod=syntax

let s:projections = {
      \ '*.c': {'type': 'c', 'alternate': ['{}.h']},
      \ '*.h': {'type': 'c', 'alternate': ['{}.c']},
      \ '*.cpp': {'type': 'cpp', 'alternate': ['{}.hpp']},
      \ '*.hpp': {'type': 'cpp', 'alternate': ['{}.cpp']},
      \ '*': {}
      \ }

function! s:ProjectionistDetect() abort
  if &filetype ==# 'c' || &filetype ==# 'cpp'
    let l:projections = deepcopy(s:projections)
    call projectionist#append(getcwd(), l:projections)
  endif
endfunction

augroup c_projectionist
  autocmd!
  autocmd User ProjectionistDetect call s:ProjectionistDetect()
augroup END

