#!/bin/bash

DOTFILE_DIR=$HOME/.dotfiles

DOTFILES=(
    "zsh"
    "git"
    "neovim"
    "alacritty"
    "tmux"
    "emacs"
    "editorconfig"
)

cd $DOTFILE_DIR

for dotfile in "${DOTFILES[@]}";do
    echo "🔗 Linking dotfile: $HOME/${dotfile}"
    stow $dotfile
done
