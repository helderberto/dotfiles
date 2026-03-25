#!/usr/bin/env bash
set -e

if ! command -v mas &>/dev/null; then
    echo "mas not installed, skipping App Store apps"
    exit 0
fi

mas install 425424353 || true  # The Unarchiver
mas install 937984704 || true  # Amphetamine
mas install 961632517 || true  # Be Focused Pro
