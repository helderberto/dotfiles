#!/bin/sh

echo "🔧 Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

source $HOME/homebrew/brew.sh
source $HOME/homebrew/brew-cask.sh
source $HOME/mac/app-store.sh

# Remove Workspace
rm -rf $HOME/Workspace

# Create a Workspace directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Workspace
mkdir $HOME/Workspace/labs

source symlink.sh

# Install configurations from zsh
source $HOME/.zshrc

# Set macOS preferences
# We will run this last because this will reload the shell
source $HOME/mac/.macos

# Add default apps to Dock
source $HOME/mac/dock.sh
