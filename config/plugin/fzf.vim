function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

command! FZFBuffers call fzf#run({
      \   'source':  reverse(<sid>buflist()),
      \   'sink':    function('<sid>bufopen'),
      \   'options': '+m',
      \   'down':    len(<sid>buflist()) + 2
      \ })

command! FZFMru call fzf#run({
      \ 'source':  reverse(s:all_files()),
      \ 'sink':    'edit',
      \ 'options': '-m -x +s',
      \ 'down':    '40%' })

function! s:all_files()
    return extend(
      \ filter(copy(v:oldfiles),
      \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
      \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --excmd=number --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  execute split(a:line, "\t")[2]
endfunction

function! s:btags()
  try
    call fzf#run({
    \ 'source':  s:btags_source(),
    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
    \ 'down':    '40%',
    \ 'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! FZFBTags call s:btags()

function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! FZFTags call s:tags()

function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\})

function! s:define_user_command()
  " Change wildignore into space or | separated groups
  " e.g. .aux .out .toc .jpg .bmp .gif
  " or   .aux$\|.out$\|.toc$\|.jpg$\|.bmp$\|.gif$
  let pats = ['[*\/]*\([?_.0-9A-Za-z]\+\)\([*\/]*\)\(\\\@<!,\|$\)','\\\@<!,', '\.']
  let subs = has('win32') || has('win64') ? ['\1\3', ' ', '\.'] : ['\1\2\3', '\\|', '\\.']
  let expr = substitute(&wig, pats[0], subs[0], 'g')
  let expr = substitute(expr, pats[1], subs[1], 'g')
  let expr = substitute(expr, pats[2], subs[2], 'g')
  let expr = substitute(expr, '\\,', ',', 'g')

  " Set the user_command option
  if executable('ag')
    let g:ctrlp_use_caching = 0
    let cmd = 'ag %s -U -l --hidden --nocolor -g ""'
  else
    let cmd = 'find %s -type f'
  endif

  " Set the user_command option
  let g:ctrlp_user_command = has('win32') || has('win64')
        \ ? 'dir %s /-n /b /s /a-d | findstr /V /l "'.expr.'"'
        \ : cmd . ' | grep -v "'.expr .'"'
endfunction

command! FZFColors call fzf#run({
      \   'source':
      \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
      \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
      \   'sink':    'colo',
      \   'options': '+m',
      \   'left':    30
      \ })

nnoremap <C-p> :FZF<cr>
nnoremap <leader>f :FZF<cr>
nnoremap <leader>m :FZFMru<cr>
nnoremap <leader>F :FZFBTags<cr>
nnoremap <leader>S :FZFTags<cr>
nnoremap <leader>L :FZFLines<cr>
nnoremap <leader>b :FZFBuffers<cr>
nnoremap <leader>C :FZFColors<cr>

