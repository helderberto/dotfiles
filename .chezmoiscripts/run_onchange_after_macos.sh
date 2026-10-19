#!/usr/bin/env bash
set -e

defaults write NSGlobalDomain KeyRepeat -int 2                          # Fast key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15                  # Short delay before repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false      # Hold key repeats instead of accent popup
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true # Natural scrolling
defaults write NSGlobalDomain AppleShowAllExtensions -bool true         # Show file extensions
defaults write com.apple.dock autohide -bool true                       # Auto-hide Dock
defaults write com.apple.dock autohide-delay -float 0                   # Show Dock instantly
defaults write com.apple.finder ShowPathbar -bool true                  # Finder path bar
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true # No .DS_Store on network shares
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true     # No .DS_Store on USB drives

launchctl bootstrap "gui/$(id -u)" ~/Library/LaunchAgents/local.capslock-ctrl.plist 2>/dev/null || true # Caps Lock → Left Ctrl

killall Dock Finder 2>/dev/null || true
