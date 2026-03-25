#!/usr/bin/env bash
set -e

mkdir -p "$HOME/workspace/labs"
[ -f "$HOME/.private" ] || touch "$HOME/.private"
