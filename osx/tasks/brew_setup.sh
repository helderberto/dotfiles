#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Remove outdated versions from the cellar
brew cleanup

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# It will install all from Brewfile
brew bundle --file=~/.dotfiles/osx/tasks/Brewfile
