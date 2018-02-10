let g:autoformat_autoindent = 0
let g:autoformat_retab = 0

let g:formatters_javascript = ['eslint_local']
let g:formatters_vue = ['eslint_local']

au BufWrite * :Autoformat
