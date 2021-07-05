#!/bin/env bash

source ~/.dotfiles/common/functions.sh

# Create a Workspace directory
if [ ! -d "$HOME/workspace" ]; then
    mkdir -p $HOME/workspace
    msg_checking "created ~/workspace"
fi

# Create a labs directory inside of workspace
if [ ! -d "$HOME/workspace/labs" ]; then
    mkdir -p $HOME/workspace/labs
    msg_checking "created ~/workspace/labs"
fi
