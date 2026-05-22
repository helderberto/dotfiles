#!/usr/bin/env bash
set -e

if ! xcode-select -p &>/dev/null; then
    xcode-select --install
    echo "Re-run after Xcode CLI tools finish installing."
    exit 0
fi

SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"

if ! command -v chezmoi &>/dev/null; then
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
    export PATH="$HOME/.local/bin:$PATH"
fi

chezmoi init --source "$SOURCE_DIR"
chezmoi apply --source "$SOURCE_DIR"
