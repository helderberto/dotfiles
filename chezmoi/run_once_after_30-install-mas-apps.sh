#!/usr/bin/env bash
# Install Mac App Store applications

set -e

if ! command -v mas &>/dev/null; then
    echo "⚠️  mas not installed, skipping App Store apps"
    exit 0
fi

echo "📱 Installing Mac App Store apps..."

# Function to check and install app
install_if_needed() {
    local app_name="$1"
    local app_id="$2"

    if ! mas list | grep -q "$app_id"; then
        echo "  Installing $app_name..."
        mas install "$app_id" || echo "  ⚠️  Failed to install $app_name"
    else
        echo "  ✓ $app_name already installed"
    fi
}

# Install apps
install_if_needed "The Unarchiver" "425424353"
install_if_needed "Amphetamine" "937984704"
install_if_needed "GIPHY CAPTURE" "668208984"
install_if_needed "Be Focused Pro: Pomodoro Timer" "961632517"
install_if_needed "Bear" "1091189122"

echo "✓ Mac App Store apps installed"
