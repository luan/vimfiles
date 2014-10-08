# The Vim Configuration. [![Build Status](https://travis-ci.org/luan/vimfiles.svg?branch=master)](https://travis-ci.org/luan/vimfiles)

If you're trying to use this config checkout this [cheat sheet](https://github.com/luan/vimfiles/wiki/Luan's-Vim-Cheat-Sheet).

## Installation

1. `git clone http://github.com/luan/vimfiles.git ~/.vim`
1. `~/.vim/install` [more...](#install-script)
1. Enjoy

## Recommended Setup (OSX/Linux)

### Faster and better autocomplete

**OSX**
```bash
brew reinstall vim --with-lua
brew reinstall macvim --with-lua
```

**Linux**
```bash
sudo apt-get install vim-nox
```

### ctags

**OSX**
```bash
brew uninstall ctags
brew tap kopischke/ctags
brew install ctags-fishman --HEAD
```

**Linux**
For now you have to manually compile and replace your ctags installation with: https://github.com/fishman/ctags

## Plugin Installation / Requirements

I may make this more verbose later, but for now, here's a list of plugins that require further installation:

 * [Fugitive](https://github.com/tpope/vim-fugitive) Requires Git to be installed.
 * [ag.vim](https://github.com/rking/ag.vim) Requires [ag](https://github.com/ggreer/the_silver_searcher) to be installed.
 * [ack.vim](https://github.com/mileszs/ack.vim) Requires [ack](http://betterthangrep.com/) to be installed.
 * [tagbar](https://github.com/majutsushi/tagbar) Requires [exuberant-ctags](https://github.com/fishman/ctags)

## Screenshots

**MacVim**

[![MacVim](https://github.com/luan/vimfiles/raw/master/screenshots/mvim.png)](https://github.com/luan/vimfiles/raw/master/screenshots/mvim.png)

**Terminal Vim**

[![Terminal Vim](https://github.com/luan/vimfiles/raw/master/screenshots/vim.png)](https://github.com/luan/vimfiles/raw/master/screenshots/vim.png)

## Install Script

The directory contains a bash script named `install`. `install` will create your local override files (`.vimrc.loca.before` and `.vimrc.local`), symlink `.vimrc` and `.gvimrc`.
It will also install `golang`'s tools if you have golang on your `$PATH`.

## Notes

Be sure to always edit the vimrc using `,vi`, which opens the vimrc in the .vim folder. Vim has a nasty habit of overriding symlinks.


