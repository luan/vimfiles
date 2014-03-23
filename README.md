# The Vim Configuration.

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/luan/vimfiles/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

## Installation

1. `git clone http://github.com/luan/vimfiles.git` in your home folder.
2. `mv vimfiles .vim`
3. `cd .vim`
4. `rake bootstrap` Runs everything you need to get started
5. Enjoy enhanced productivity, increased levitation, reduced watermelon-related accidents, and startling sex appeal.

## Tasks

```
rake bootstrap              # Runs everything you need to get started
rake plugins:compile        # Compile stuff, like Command-T.
rake vim:create_locals      # Create local configs
rake vim:link               # Create symlinks
```

## Screenshots

**MacVim**

[![MacVim](https://github.com/luan/vimfiles/raw/master/screenshots/mvim_small.png)](https://github.com/luan/vimfiles/raw/master/screenshots/mvim.png)

**Terminal Vim**
[![Terminal Vim](https://github.com/luan/vimfiles/raw/master/screenshots/vim_small.png)](https://github.com/luan/vimfiles/raw/master/screenshots/vim.png)

## Notes

Be sure to always edit the vimrc using `,vi`, which opens the vimrc in the .vim folder. Vim has a nasty habit of overriding symlinks.
There are two options about the test runner:

```
" will check for gemfile and run bundle exec if present
" bundle exec slows down startup so if you can avoid it good
" 0 or 1, defaults 0
let g:check_gemfile=1

" will use test server even when on terminal vim
" default behavior is only when on GUI vim (e.g. mVim or gVim)
" 0 or 1, defaults 0
let g:always_use_test_server=1
```

## Plugin Installation / Requirements

I may make this more verbose later, but for now, here's a list of plugins that require further installation:

 * [Fugitive](https://github.com/tpope/vim-fugitive) Requires Git to be installed.
 * [ack.vim](https://github.com/mileszs/ack.vim) Requires [ack](http://betterthangrep.com/) to be installed.
 * [ag.vim](https://github.com/rking/ag.vim) Requires [ag](https://github.com/ggreer/the_silver_searcher) to be installed.

