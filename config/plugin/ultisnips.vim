let g:UltiSnips = {}

let g:UltiSnips.always_use_first_snippet = 1
let g:UltiSnips.ExpandTrigger = '<tab>'
let g:UltiSnips.ListSnippets = '<c-r><tab>'
let g:UltiSnips.JumpForwardTrigger = '<tab>'
let g:UltiSnips.JumpBackwardTrigger = '<s-tab>'
let g:UltiSnips.snipmate_ft_filter = {
      \ 'default' : {'filetypes': ["FILETYPE"] },
      \ 'ruby'    : {'filetypes': ["ruby", "ruby-rails", "ruby-1.9"] }
      \ }
