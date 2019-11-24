#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Create a Workspace directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Workspace
mkdir $HOME/Workspace/labs

# Removes .zshrc from $HOME (if it exists)
rm -rf $HOME/.zshrc

# Create symlinks the .zshrc file from the .dotfiles
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
