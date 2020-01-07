#!/bin/bash

DOTFILE_DIR=$HOME/.dotfiles

DOTFILES=(
	"zsh"
	"bash"
	"git"
)

for dotfile in "${DOTFILES[@]}";do
	echo "🔗 Linking dotfile: $HOME/.${dotfile}"
	stow $dotfile
done
