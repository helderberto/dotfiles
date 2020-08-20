#!/bin/bash

DOTFILE_DIR=$HOME/.dotfiles

DOTFILES=(
	"zsh"
	"bash"
	"git"
	"alacritty"
	"tmux"
	"emacs"
    "vim"
)

cd $DOTFILE_DIR

for dotfile in "${DOTFILES[@]}";do
	echo "🔗 Linking dotfile: $HOME/${dotfile}"
	stow $dotfile
done
