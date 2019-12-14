#!/bin/bash

DOTFILE_DIR=$HOME/.dotfiles

DOTFILES=(
	".zshrc"
	".p10k.zsh"
	".bash_profile"
	".gitconfig"
)

for dotfile in "${DOTFILES[@]}";do
	echo "🗑 Deleting dotfile: $HOME/${dotfile}"
	rm -rf "$HOME/${dotfile}"

	echo "🔗 Linking dotfile: ${DOTFILE_DIR}/${dotfile} to $HOME/${dotfile}"
	ln -sf "${DOTFILE_DIR}/${dotfile}" "$HOME/${dotfile}"
done
