#!/bin/zsh

###########################
# This script installs the dotfiles and runs macOS configurations
# @author Helder Burato Berto
###########################

echo "🔧 Setting up your Mac..."

# Set macOS preferences
sh ./osx/.default_config

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

if test ! $(which zsh); then
    curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | zsh
fi

echo "📲 Installing homebrew/app store packages..."
sh ./osx/tasks/brew.sh
sh ./osx/tasks/brew_cask.sh
sh ./osx/tasks/mas.sh
echo "✅ Successful installed packages"

echo "🔗 Creating and configuring NVM"
sh ./osx/tasks/nvm_setup.sh
echo "✅ Successful configured NVM"

echo "📁 Creating workspace directory..."
sh ./osx/tasks/create_workspace.sh
echo "✅ Successful created workspace"

echo "🔗 Linking configuration files..."
sh ./osx/tasks/symlink.sh
echo "✅ Successful linked configuration files"

echo "ℰ Installing Doom Emacs"
sh ./common/doom_emacs_setup.sh
echo "✅ Successful installed Doom Emacs"

# Install configurations from zsh
echo "🔧 Setting configuration to iTerm2 and zsh..."
source $HOME/.zshrc
echo "✅ Successful configured iTerm2 and zsh"

# Add default apps to Dock
echo "🖥 Setting apps to Mac dock..."
sh ./osx/dock/setup.sh
echo "✅ Successful set apps to Mac dock"

echo "⚡️ All right! Restart your machine to complete the configuration."
