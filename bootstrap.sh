#!/usr/bin/env bash
set -e

if ! xcode-select -p &>/dev/null; then
    xcode-select --install
    echo "Re-run after Xcode CLI tools finish installing."
    exit 0
fi

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply helderberto/dotfiles
