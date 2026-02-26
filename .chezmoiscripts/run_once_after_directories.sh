#!/usr/bin/env bash
# Create workspace directories

set -e

echo "📁 Creating workspace directories..."

# Create workspace directory
if [ ! -d "$HOME/workspace" ]; then
    mkdir -p "$HOME/workspace"
    echo "  ✓ Created ~/workspace"
else
    echo "  ✓ ~/workspace already exists"
fi

# Create labs directory
if [ ! -d "$HOME/workspace/labs" ]; then
    mkdir -p "$HOME/workspace/labs"
    echo "  ✓ Created ~/workspace/labs"
else
    echo "  ✓ ~/workspace/labs already exists"
fi

echo "✓ Workspace directories ready"
