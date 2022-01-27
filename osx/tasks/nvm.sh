#!/usr/bin/env bash

source ~/.dotfiles/common/functions.sh

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
