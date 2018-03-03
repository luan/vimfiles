let g:javascript_plugin_flow = 1
let g:used_javascript_libs = 'jquery,underscore,vue,jasmine,ramda,d3,react'

augroup luan_js
  autocmd!
  autocmd FileType javascript setlocal foldmethod=syntax
  autocmd BufRead,BufNewFile .eslintrc setlocal filetype=json
augroup END

