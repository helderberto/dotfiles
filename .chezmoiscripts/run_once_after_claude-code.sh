#!/usr/bin/env bash
set -e

if command -v claude &>/dev/null; then
    exit 0
fi

curl -fsSL https://claude.ai/install.sh | bash
