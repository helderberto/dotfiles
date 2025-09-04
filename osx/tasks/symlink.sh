#!/bin/bash

source ~/.dotfiles/common/functions.sh

DOTFILE_DIR=$HOME/.dotfiles

DOTFILES=(
    "zsh"
    "git"
    "asdf"
    "nvim"
    "alacritty"
    "tmux"
    "editorconfig"
    "ghostty"
)

cd $DOTFILE_DIR

for dotfile in "${DOTFILES[@]}";do
    msg_checking "Linking file to $HOME/${dotfile}"
    stow $dotfile
done
