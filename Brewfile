# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
update

# Cask
install caskroom/cask/brew-cask

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
#install apple-gcc42
install coreutils
# Install some other useful utilities like `sponge`
install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
install findutils
# Install GNU `sed`, overwriting the built-in `sed`
install gnu-sed --default-names
# Install Bash 4
install bash
install bash-completion

# Install wget with IRI support
install wget --enable-iri

# Install make utilities
install cmake
install automake

# Install utility libraries
install libxml2
install libyaml
install readline

# Install OpenSSL
install openssl

# Install Version Control
install git --with-gettext --with-pcre --with-brewed-openssl
install bazaar
install mercurial

# Cloud
install s3cmd

# Install MacVim with lua
install macvim --override-system-vim --with-lua --with-luajit

install the_silver_searcher
install phantomjs
install hub
install rbenv
install ruby-build
install rbenv-default-gems
install rbenv-bundler

# DBs
install influxdb
# Needs java
# install elasticsearch
install postgresql
install sqlite

# Programming Languages
#install r
install node
# Installing from source seems more sane
# install go --cross-compile-common
install python --universal --framework --with-brewed-openssl

# System
install fig
install httpie
