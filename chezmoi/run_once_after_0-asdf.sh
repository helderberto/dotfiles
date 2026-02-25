#!/usr/bin/env bash
set -e

if ! command -v asdf &>/dev/null; then
    echo "⚠️  asdf not found, skipping"
    exit 0
fi

echo "🔧 Setting up asdf plugins..."

asdf plugin add nodejs || true
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git 2>/dev/null || true

echo "📦 Installing asdf versions from ~/.tool-versions..."
asdf install || true

echo "✓ asdf setup complete"
