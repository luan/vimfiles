autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.scss foldmethod=syntax
autocmd BufWritePost *.vue syntax sync fromstart
autocmd BufReadPost *.vue syntax sync fromstart
autocmd FileType vue syntax sync fromstart
