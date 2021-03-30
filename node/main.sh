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
    nvm install --lts
    nvm use default

    ## Solve issue zsh compinit: insecure directories and files, run compaudit for list.
    compaudit | xargs chmod g-w
    msg_ok "OK"
fi
