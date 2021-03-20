#!/usr/bin/env bash

###########################
# This script installs the dotfiles and runs macOS configurations
# @author Helder Burato Berto
###########################

CONFIG_DIR=$(dirname "$0")

echo "🔧 Setting up your Mac..."

# Set macOS preferences
sh $CONFIG_DIR/osx/.macos

# Install non-brew various tools (PRE-BREW Installs)
echo "Ensuring build/install tools are available"
if ! xcode-select --print-path &> /dev/null; then
    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? ' XCode Command Line Tools Installed'

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install oh-my-zsh now
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Neovim vim-plug - https://github.com/junegunn/vim-plug#neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "📁 Creating workspace and org dirs..."
sh $CONFIG_DIR/osx/tasks/create_dirs.sh
echo "✅ Successful created workspace"

echo "📲 Installing Homebrew, App Store, NVM..."
sh $CONFIG_DIR/osx/install/brew.sh
sh $CONFIG_DIR/osx/install/mas.sh
sh $CONFIG_DIR/osx/install/nvm.sh
echo "✅ Successful installed packages"

echo "ℰ Installing Doom Emacs"
sh $CONFIG_DIR/install/doom_emacs.sh
echo "✅ Successful installed Doom Emacs"

echo "🔗 Linking configuration files..."
sh $CONFIG_DIR/osx/tasks/symlink.sh
echo "✅ Successful linked configuration files"

# Add default apps to Dock
echo "🖥 Setting apps to Mac dock..."
sh $CONFIG_DIR/osx/tasks/dock.sh
echo "✅ Successful set apps to Mac dock"

# Install configurations from zsh
echo "🔧 Setting configuration to zsh..."
source $HOME/.zshrc
echo "✅ Successful configured zsh"

echo "⚡️ All right! Restart your machine to complete the configuration."
