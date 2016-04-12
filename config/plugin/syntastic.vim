let g:syntastic_python_checkers = ['flake8']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['ruby'] }
let g:syntastic_go_gometalinter_args = '-t --disable-all -E vet -E dupl -E deadcode --dupl-threshold=75'
let g:syntastic_go_checkers = ['go', 'gometalinter']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

