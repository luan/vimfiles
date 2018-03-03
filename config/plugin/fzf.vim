function! s:buflist()
  redir => l:ls
  silent ls
  redir END
  return split(l:ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

let g:ctrlp_map = ''
let g:ctrlp_cmd = ''
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'
endif

command! -bang -nargs=* FZFRg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '
      \      . shellescape(<q-args>), 1, <bang>0
      \ )

nnoremap <C-p>     :FZFFiles<cr>
nnoremap <leader>f :FZFFiles<cr>
nnoremap <leader>m :FZFHistory<cr>
nnoremap <leader>F :FZFBTags<cr>
nnoremap <leader>S :FZFTags<cr>
nnoremap <leader>L :FZFLines<cr>
nnoremap <leader>b :FZFBuffers<cr>
nnoremap <leader>C :FZFColors<cr>
nnoremap <leader>G :FZFRg<space>
nnoremap <leader>: :FZFHistory:<cr>
nnoremap <leader>? :FZFHistory/<cr>
nnoremap <leader><c-j> :FZFSnippets<cr>
nnoremap <leader>d :FZFCommands<cr>

