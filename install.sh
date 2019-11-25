#!/bin/sh

echo "🔧 Setting up your Mac..."

# Set macOS preferences
# We will run this last because this will reload the shell
# source ./mac/.macos

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "📲 Installing homebrew/app store packages..."
source ./homebrew/brew.sh
source ./homebrew/brew-cask.sh
source ./mac/app-store.sh
echo "✅ Successful installed packages"

echo "🧹 Cleanup workspaces..."
# Remove Workspace
rm -rf $HOME/Workspace
echo "✅ Successful cleanup workspaces"

echo "📁 Creating workspaces dirs..."
# Create a Workspace directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Workspace
mkdir $HOME/Workspace/labs
echo "✅ Successful created workspaces"

echo "🔗 Linking configuration files..."
source ./symlink.sh
echo "✅ Successful linked configuration files"

# Install configurations from zsh
echo "🔧 Setting configuration to iTerm2 and zsh..."
source $HOME/.zshrc
echo "✅ Successful configured iTerm2 and zsh"

# Add default apps to Dock
echo "🖥 Setting apps to Mac dock..."
source ./mac/dock.sh
echo "✅ Successful set apps to Mac dock"

echo "⚡️ All right! Restart your machine to complete the configuration."
