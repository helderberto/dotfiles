#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# It will install all from Brewfile
brew bundle 

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Remove outdated versions from the cellar
brew cleanup
