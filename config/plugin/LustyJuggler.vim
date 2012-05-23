" ---------------
" Lusty Juggler
" ---------------
if has('unix')
  " Allows for previous buffer on unix systems without most recent patch level
  " that enable LustyJuggler to work
  nnoremap <leader>, :e#<CR>
else
  nnoremap <leader>, :LustyJugglePrevious<CR>
end
let g:LustyJugglerShowKeys=1 " Show numbers for Lusty Buffers
let g:LustyJugglerSuppressRubyWarning=1
