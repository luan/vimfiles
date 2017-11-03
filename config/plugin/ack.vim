if executable('rg')
  let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

command! Ag :echoerr(':Ag is no longer available please use :Ack instead (it will gracefully detect ripgrep or the silver searcher if you have them installed)')
