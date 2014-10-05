let g:unite_source_history_yank_enable = 1
let g:unite_matcher_fuzzy_max_input_length = 100
call unite#filters#matcher_default#use(['matcher_project_files', 'matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_length', 'sorter_rank'])

call unite#custom#profile('default', 'context', {
      \   'prompt_direction': 'above',
      \   'direction': 'botright',
      \   'winheight': '10',
      \   'cursor_line_highlight': 'CursorLine',
      \   'abbr_highlight': 'Normal',
      \   'unique': '1',
      \ })

call unite#custom#source(
      \ 'file_mru', 'matchers',
      \ ['converter_relative_word', 'matcher_project_files', 'matcher_fuzzy'])

nnoremap <silent> [unite]files              :<C-u>Unite -start-insert -buffer-name=files buffer file_mru file_rec/async:!<cr>
nnoremap <silent> [unite]siblings           :<C-u>Unite -start-insert -buffer-name=files file -input=<C-r>=expand("%:h")<cr>/<cr>
nnoremap <silent> [unite]most-recently-used :<C-u>Unite -start-insert -buffer-name=mru file_mru<cr>
nnoremap <silent> [unite]buffers            :<C-u>Unite -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]lines              :<C-u>Unite -start-insert -buffer-name=line line<cr>
nnoremap <silent> [unite]tags               :<C-u>Unite -start-insert -buffer-name=tag tag<cr>
nnoremap <silent> [unite]grep               :<C-u>Unite grep:. -default-action=persist_open<cr>

nmap <leader>f [unite]files
nmap <C-p>     [unite]files
nmap <leader>e [unite]siblings
nmap <leader>m [unite]most-recently-used
nmap <leader>b [unite]buffers
nmap <leader>L [unite]lines
nmap <leader>S [unite]tags
nmap <leader>F [unite]grep

if executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

au FileType unite call s:unite_settings()
function! s:unite_settings()
  let b:actually_quit = 0
  setlocal updatetime=3
  au! InsertEnter <buffer> let b:actually_quit = 0
  au! InsertLeave <buffer> let b:actually_quit = 1
  au! CursorHold  <buffer> if exists('b:actually_quit') && b:actually_quit | close | endif

  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)

  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  imap <buffer> <C-b> <Left>
  imap <buffer> <C-f> <Right>
  imap <buffer> <C-a> <C-o>:call <SID>home()<CR>
  imap <buffer> <C-e> <End>
  imap <buffer> <C-d> <Del>
  imap <buffer> <C-h> <BS>
endfunction

autocmd BufEnter *
  \   if empty(&buftype)
  \|      nnoremap <buffer> g] :<C-u>UniteWithCursorWord -immediately tag<CR>
  \|  endif
