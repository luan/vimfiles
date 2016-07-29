function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

let g:ctrlp_map = ''
let g:ctrlp_cmd = ''

nnoremap <C-p>     :FZFFiles<cr>
nnoremap <leader>f :FZFFiles<cr>
nnoremap <leader>m :FZFHistory<cr>
nnoremap <leader>F :FZFBTags<cr>
nnoremap <leader>S :FZFTags<cr>
nnoremap <leader>L :FZFBLines<cr>
nnoremap <leader>b :FZFBuffers<cr>
nnoremap <leader>C :FZFColors<cr>

