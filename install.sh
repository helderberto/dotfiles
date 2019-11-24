#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

source brew.sh
source brew-cask.sh
source mac-app-store.sh

# Removes Workspace, .zshrc, .bash_profile, .gitconfig from $HOME (if it exists)
rm -rf $HOME/Workspace $HOME/.zshrc $HOME/.bash_profile $HOME/.gitconfig

# Create a Workspace directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Workspace
mkdir $HOME/Workspace/labs

# Removes .zshrc, .bash_profile, .gitconfig from $HOME (if it exists)
rm -rf $HOME/.zshrc $HOME/.bash_profile $HOME/.gitconfig

# Create symlinks from .zshrc, .bash_profile, .gitconfig files
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/.bash_profile ~/.bash_profile
ln -s $HOME/.dotfiles/.gitconfig ~/.gitconfig

# Install configurations from zsh
source $HOME/.zshrc

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
