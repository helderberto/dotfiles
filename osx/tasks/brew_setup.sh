#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# it will install all from Brewfile
brew bundle install

# Remove outdated versions from the cellar
brew cleanup
