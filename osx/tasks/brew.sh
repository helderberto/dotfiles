#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Brew Tap (Third-Party Repositories)
brew tap homebrew/bundle
brew tap homebrew/core
brew tap homebrew/cask
brew tap homebrew/cask-fonts

# Install font
brew install --cask font-hack
brew install --cask font-hack-nerd-font

# Install useful packages/binaries
brew install antigen
brew install cmake
brew install lsd # replace ls command
brew install fd
brew install fzf
brew install git
brew install gnu-sed
brew install gpac
brew install gpatch
brew install mas
brew install pandoc
brew install ripgrep
brew install stow
brew install tldr
brew install neovim
brew install tmux
brew install tree
brew install yarn --ignore-dependencies
brew install z
brew install openjdk
brew install grip
brew install http-server
brew install asdf # package manager for multiple languages
brew install stylua # lua formatter

# This is needed for fzf to know how to ignore files listed in .gitignore
# and know how to show hidden files
# It is also a good CLI tool
brew install ag

# Install cask packages
brew install --cask alacritty
brew install --cask figma
brew install --cask google-chrome
brew install --cask arc # My default browser
brew install --cask imageoptim
brew install --cask slack
brew install --cask discord
brew install --cask spotify
brew install --cask 1password # Password manager - https://1password.com/
brew install --cask grammarly
brew install --cask visual-studio-code
brew install --cask hiddenbar # Hide menu Mac - https://github.com/dwarvesf/hidden
brew install --cask raycast # Override native Spotlight from MacOS
brew install --cask postman
brew install --cask insomnia
brew install --cask todoist # Task manager
brew install --cask betterdisplay # Display resolution manager

# Remove outdated versions from the cellar.
brew cleanup
