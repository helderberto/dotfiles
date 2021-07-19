#!/usr/bin/env bash

# Setup a macOS environment quickly and easily!
#
# AUTHOR: Helder Burato Berto

# Set current directory ~/dotfiles to CONFIG_DIR
CONFIG_DIR=$(dirname "$0")

echo "🔧 Setting up your Mac..."

# Set zsh as your default shell
sudo chsh -s $(which zsh)

sh $CONFIG_DIR/common/install.sh
sh $CONFIG_DIR/brew/main.sh
sh $CONFIG_DIR/node/main.sh

# macOS
sh $CONFIG_DIR/osx/.macos
sh $CONFIG_DIR/osx/tasks/symlink.sh
sh $CONFIG_DIR/osx/tasks/dock.sh
sh $CONFIG_DIR/osx/tasks/create_dirs.sh
sh $CONFIG_DIR/osx/mas.sh

# load zsh configs
source ~/.zshrc
