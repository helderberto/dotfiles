#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed
# Pandoc a universal document converter
brew install pandoc
# Exa https://github.com/ogham/exa
brew install exa

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

brew install antigen
brew install git
brew install tree
brew install nvm
brew install yarn
brew install mas
brew install stow
brew install tmux
brew install tldr

brew tap d12frosted/emacs-plus
brew install emacs-plus@28

# Remove outdated versions from the cellar
brew cleanup
