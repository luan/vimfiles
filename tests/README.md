# Tests #

The motivation at the time of writing is to be able to refactor
`lib/functions.vim` test running functions so that they can be extended. For example
it would be nice to add python/pytest running without hacking in yet more code to this
file.

## Setup ##

Currently the tests depend on [vimrunner](https://github.com/AndrewRadev/vimrunner)
and have only been run against macvim. The reason for macvim is it has a reliable
vim client server implementation that normal vim does not, at least not vim with
xquartz on macos.

### Install macvim ###

    brew cask install macvim

## Run tests ##

    cd tests
    bundle install
    bundle exec rspec spec
