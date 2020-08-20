#!/usr/bin/env bash
set -euo pipefail

mkdir ~/.nvm
nvm install --lts
nvm use node
nvm run node --version

