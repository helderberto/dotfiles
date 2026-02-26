#!/usr/bin/env bash
set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info() { echo -e "${YELLOW}→${NC} $1"; }
done_() { echo -e "${GREEN}✓${NC} $1"; }

# 1. Xcode CLI tools
if ! xcode-select -p &>/dev/null; then
    info "Installing Xcode CLI tools..."
    xcode-select --install
    echo "Re-run this script after Xcode CLI tools finish installing."
    exit 0
else
    done_ "Xcode CLI tools"
fi

# 2. Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    info "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    done_ "Oh My Zsh installed"
else
    done_ "Oh My Zsh"
fi

# 3. Set zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    info "Setting zsh as default shell..."
    sudo chsh -s "$(which zsh)" "$USER"
    done_ "Default shell set to zsh"
else
    done_ "Default shell"
fi

# 4. chezmoi
if ! command -v chezmoi &>/dev/null; then
    info "Installing chezmoi..."
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
    export PATH="$HOME/.local/bin:$PATH"
    done_ "chezmoi installed"
else
    done_ "chezmoi"
fi

echo ""
echo "Bootstrap complete. Now run:"
echo "  chezmoi init helderberto/dotfiles --apply"
