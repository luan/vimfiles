augroup luan_markdown
  autocmd!
  autocmd BufNewFile,BufRead *.md setlocal spell | setlocal lbr | setlocal nonu
augroup END
let g:markdown_fenced_languages = ['html', 'json', 'css', 'javascript', 'vim', 'go', 'ruby', 'python', 'bash=sh']
