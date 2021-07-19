#!/usr/bin/env bash

# Setup a macOS environment quickly and easily!
#
# AUTHOR: Helder Burato Berto

# Set current directory ~/dotfiles to CONFIG_DIR
CONFIG_DIR=$(dirname "$0")

echo "🔧 Setting up your Mac..."

# Set zsh as your default shell
sudo chsh -s $(which zsh)

# Set macOS preferences
sh $CONFIG_DIR/osx/.default_config

sh $CONFIG_DIR/common/install.sh
sh $CONFIG_DIR/osx/tasks/brew.sh
sh $CONFIG_DIR/osx/tasks/mas.sh
sh $CONFIG_DIR/osx/tasks/nvm.sh
sh $CONFIG_DIR/osx/tasks/create_workspace.sh
sh $CONFIG_DIR/osx/tasks/symlink.sh
sh $CONFIG_DIR/osx/tasks/nvim.sh
sh $CONFIG_DIR/osx/tasks/dock.sh

echo "⚡️All right! Restart your machine to complete the configuration."

# Restart macOS immediately
echo "🖥  Rebooting macOS immediately"
sudo reboot
echo "✅ Successful Reboot macOS command"
