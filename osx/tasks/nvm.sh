#!/usr/bin/env bash
set -euo pipefail

# Download and install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Install LTS version
nvm install --lts
nvm use --lts 
nvm run node --version

## Solve issue zsh compinit: insecure directories and files, run compaudit for list.
compaudit | xargs chmod g-w
