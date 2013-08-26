let g:UltiSnips = {}

let g:UltiSnips.always_use_first_snippet = 1
let g:UltiSnips.ExpandTrigger="<c-j>"
let g:UltiSnips.snipmate_ft_filter = {
      \ 'default' : {'filetypes': ["FILETYPE"] },
      \ 'ruby'    : {'filetypes': ["ruby", "ruby-rails", "ruby-1.9"] }
      \ }
