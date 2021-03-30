#!/bin/env bash

source ~/.dotfiles/common/functions.sh

# Create a Workspace directory
if [ ! -d "$HOME/workspace" ]; then
    mkdir -p $HOME/workspace
    msg_checking "created ~/workspace"
fi

# Create org directory
if [ ! -d "$HOME/org" ]; then
    mkdir -p $HOME/org
    msg_checking "created ~/org"
fi
