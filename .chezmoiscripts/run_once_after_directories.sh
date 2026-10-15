#!/usr/bin/env bash
set -e

mkdir -p "$HOME/workspace/labs" "$HOME/ai-desktop"
[ -f "$HOME/.private" ] || touch "$HOME/.private"
