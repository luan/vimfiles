" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------

set shell=bash

let g:has_powerline_font = 0

if has('win32') || has('win64')
  " Windows
  source $VIMRUNTIME/mswin.vim
  set guifont=Consolas:h10
  set guioptions-=T " Toolbar
  set guioptions-=m " Menubar

  " Set height and width on Windows
  set lines=60
  set columns=120

  " Windows has a nasty habit of launching gVim in the wrong working directory
  cd ~
elseif has("unix")
  let s:uname = system("uname -s")
  if s:uname =~ "Darwin"
    let g:has_powerline_font = filereadable("/Library/Fonts/Meslo LG M Regular for Powerline.otf") || filereadable($HOME."/Library/Fonts/Meslo LG M Regular for Powerline.otf")
  else
    let g:has_powerline_font = filereadable($HOME."/.fonts/Meslo LG M Regular for Powerline.otf") || filereadable("/usr/local/share/fonts/Meslo LG M Regular for Powerline.otf")
  endif
  if g:has_powerline_font
    set guifont=Meslo\ LG\ M\ for\ Powerline:h12
  elseif has('gui_running')
    set guifont=Monaco:h12
  else
    set guifont=Monospace:h12
  endif
endif

