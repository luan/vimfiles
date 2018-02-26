let g:javascript_plugin_flow = 1
let g:used_javascript_libs = 'jquery,underscore,vue,jasmine,ramda,d3,react'
au FileType javascript setlocal foldmethod=syntax
au BufRead,BufNewFile .eslintrc setlocal filetype=json

