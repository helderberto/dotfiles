#!/usr/bin/env bash

source ~/.dotfiles/common/functions.sh

# Install non-brew various tools (PRE-BREW Installs)
if which xcode-select &> /dev/null; then
    msg_checking "Xcode Command Line"
else
    msg_install "Xcode Command Line"

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? ' XCode Command Line Tools Installed'

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10
    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'

    msg_ok "OK"
fi

# oh-my-zsh - https://ohmyz.sh
if which zsh &> /dev/null; then
    msg_checking "Oh My Zsh"
else
    msg_install "Oh My Zsh" "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    msg_ok "OK"
fi

# Homebrew
if which brew &> /dev/null; then
    msg_checking "Homebrew"
else
    msg_install "Homebrew" "/bin/bash -c $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    msg_ok "OK"
fi

# Neovim vim-plug - https://github.com/junegunn/vim-plug#neovim
if [[ -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]]; then
    msg_checking "Neovim vim-plug"
else
    msg_install "vim-plug" "sh -c curl -fLo ~/.local/share}/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    msg_ok "OK"
fi

# Download and install NVM
if [ -d "$HOME/.nvm" ]; then
    msg_checking "Node Version Manager"
else
    msg_install "Node Version Manager" "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

    ## Install nvm --lts and set as default
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    ## Install and use --lts version
    nvm install --lts
    nvm use --lts
    nvm alias default node

    ## Solve problem link node from nvm to brew for yarn usage
    ## https://github.com/nijicha/install_nodejs_and_yarn_homebrew
    mkdir /usr/local/Cellar/node
    ln -s ~/.nvm/versions/node/$(nvm current)/ /usr/local/Cellar/node
    brew link --overwrite node

    ## Solve issue zsh compinit: insecure directories and files, run compaudit for list.
    compaudit | xargs chmod g-w

    msg_ok "OK"
fi
