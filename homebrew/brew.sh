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

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# z hopping around folders
brew install z

brew install git
brew install tree
brew install zsh
brew install antigen
brew install node
brew install yarn
brew install mas
brew install neovim
brew install stow

# Remove outdated versions from the cellar
brew cleanup
