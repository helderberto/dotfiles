#!/bin/bash

DIR=$HOME/.dotfiles

DOTFILES=(
	".zshrc"
	".bash_profile"
	".gitconfig"
)

for dotfile in "${DOTFILES[@]}";do
	rm -rf "$HOME/${dotfile}"
	ln -sf "${DIR}/${dotfile}" "$HOME/${dotfile}"
done
