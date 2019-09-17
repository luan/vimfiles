# The Vim Configuration. [![Build Status](https://travis-ci.org/luan/vimfiles.svg?branch=master)](https://travis-ci.org/luan/vimfiles)

If you're trying to use this config checkout this [cheat
sheet](https://github.com/luan/vimfiles/wiki/Luan's-Vim-Cheat-Sheet).

---

This vimfiles support both standard [vim](http://www.vim.org/) and
[neovim](https://neovim.io/), I'd encourage you to give neovim a try.

If you're using neovim follow [this
guide](https://github.com/neovim/neovim/wiki/Installing-Neovim) in order to get
it properly setup. The autocompletion plugin we use needs [python3
support](https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim) too.

If you choose regular vim you can install it on ubuntu via the `vim-nox` package, or
on macOS with Homebrew via `brew install vim`.

### Table of Contents

1. [Using This Configuration](#using-this-configuration)
1. [Installation](#installation)
  1. [Additional Dependencies](#additional-dependencies)
    1. [ctags](#ctags)
1. [Updating](#updating)
1. [Customizing](#customizing)
  1. [Changing Configuration](#changing-configuration)
  1. [Adding Plugins](#adding-plugins)
1. [Functionality](#functionality)
  1. [Defaults Overridden](#defaults-overridden)
1. [Screenshots](#screenshots)

## Using This Configuration

This configuration is supposed to be used directly, **not** forked. If you intend
to keep up to date with changes made to this repo it's recommended that you
just clone this repository and customize the config using the [provided
hooks](#customizing). If you have a feature or fix to submit, feel free to fork
and send a PR.

---

## Installation

As simple as:
```bash
curl vimfiles.luan.sh/install | bash

# To override you current config:
# curl vimfiles.luan.sh/install | FORCE=1 bash
```

### Additional Dependencies

Most of the dependencies are installed automatically, assuming you have a
minimal development environment for you language. For example we download all
the tools for golang and elm automatically.  `git` is assumed to be installed
and so is [`ag`](https://github.com/ggreer/the_silver_searcher) or `ack`, if either of those is not, some plugins may not behave
as expected.

#### ctags

`ctags` is used to jump to function definitions, it is not strictly necessary if
you don't need that functionality, if you want to be able to jump effectively
to definitions install the correct version of ctags.

**OSX**

```bash
brew uninstall ctags
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

**Linux**

*exuberant-ctags* from your OS is generally enough for most things, but if you
want more CSS, ruby and other goodnesses you will need to manually compile and
replace your ctags installation with: https://github.com/fishman/ctags


---

## Updating

You should frequently update you copy of this config, to get latest fixes and
improvements. To do so you can run:
```bash
vim-update
```

Assuming `/usr/local/bin` is on your `PATH` on OSX or `~/bin/` on Linux.

If that doesn't work you can always run the script directly:
```bash
~/.vim/update
```

On 11/18/2018 the Python package `neovim` was renamed to `pynvim`
Due to issues with pip the `neovim` pip package cannot be upgraded and will break neovim's python bindings.

To resolve this you can run
```bash
pip uninstall neovim pynvim
pip install pynvim
```

See https://github.com/neovim/neovim/wiki/Following-HEAD#20181118 for more details

---

## Customizing

We load 3 extra configuration files that are **NOT** part of this repo:

* `~/.vimrc.local.before` (*to open: `,vb`*): Configuration to be set before everything else, this
  runs before any plugin or any config from this repository.
* `~/.vimrc.local` (*to open: `,vl`*): Configuration to be set after everything else, this runs
  after all other configuration is loaded and all plugins are setup.
* `~/.vimrc.local.plugins` (*to open: `,vp`*): Extra plugins to be loaded (along with maybe
  optional configuration for them). Is loaded after all the default plugins are
  installed.

A common pattern is for individuals or teams to have those 3 files checked in
to a separate [dotfiles](https://github.com/luan/dotfiles) repository and have
them be symlinked into your `$HOME` directory. Symlink them before you run the
install script and everything should work.

### Changing Configuration

You might want to change some config such as disabling autocompletion or
enabling auto save, or maybe just changing your colorscheme.  You can do so by
editing the `~/.vimrc.local` file, for example:

Changing colorscheme:
```vim
colorscheme gruvbox
```

Enabling auto save:
```vim
" will save automatically when leaving the buffer
" 0 or 1, defaults 0
let g:autosave = 1
```

Disabling deoplete:
```vim
let g:deoplete#enable_at_startup = 0   " disable deoplete
```

Some configuration values need to be set before loading plugins, for that we
have the `~/.vimrc.local.before`, that get's loaded before everything else, one
example usage of it is enabling fancy characters for the airline plugin:
```vim
let g:airline_powerline_fonts = 1
```

### Adding Plugins

If you have a favorite plugin you want to install but couldn't convince me to
add it as a default you can still have it be installed by just putting it in
the `~/.vimrc.local.plugins`, like such:
```vim
" Plugin to navigate between camelCase words
Plug 'bkad/CamelCaseMotion'
```

---

## Functionality

This config packs a considerable amount of plugins, there are descriptions for
most of them [here](Plug.vim) in the comments. It also strives to not override
default behavior, although that's not always possible.

There's [space to write some
guides](https://github.com/luan/vimfiles/issues/56) as to how to effectively
use this config for certain languages. The main targets are golang and ruby,
although this configuration should be usable with most languages.

### Defaults Overridden

These bindings are known to be overridden in this config. Please open an
[issue](https://github.com/luan/vimfiles/issues/new) if you find any other.
* `|`: Default behavior is jump to column. We have it set to `:NERDTreeFocus`.
* `,`: Default is reverse repeat a `f`, `t`, `F`, or `T` search. We have it set to `<leader>`.
* `\`: Is the default `<leader>`. We have it set to `:NERDTreeToggle`.
* `<enter>` or `<cr>`: Default behavior is to move the cursor one line down. We
  have it set to save if modified (basically `:w` when the file has a change).

A lot of small defaults are overridden everywhere else, and those are just to
make editing a better experience and should in no way make this vim not feel
like vim. For a glance in some of the changes look at
[config/basic.vim](config/basic.vim).

A few overridden are worth mentioning:

```vim
set splitright
```
These change where new splits are open, when you for example do `:vs` the
default behavior is to open a split on the left, it feels more natural to open
one on the right instead.

```vim
set iskeyword+=$,@,-
```
Add extra characters that are valid parts of variables.

---

## Screenshots

**Default colorscheme: hybrid**

[![hybrid](https://github.com/luan/vimfiles/raw/master/screenshots/hybrid.png)](https://github.com/luan/vimfiles/raw/master/screenshots/hybrid.png)

**Alternate colorscheme: monokai**

[![monokai](https://github.com/luan/vimfiles/raw/master/screenshots/monokai.png)](https://github.com/luan/vimfiles/raw/master/screenshots/monokai.png)

