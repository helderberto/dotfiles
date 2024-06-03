#!/usr/bin/env bash

source ~/.dotfiles/common/functions.sh
source ~/.dotfiles/osx/tasks/dock_utils.sh

# WARNING: permanently clears existing dock
clear_dock
disable_recent_apps_from_dock

msg_install "Dock"
add_app_to_dock "Chrome"
add_app_to_dock "Alacritty"
add_app_to_dock "Bear"
add_app_to_dock "Visual Studio Code"
add_app_to_dock "Slack"
add_app_to_dock "Spotify"
add_folder_to_dock $HOME/Downloads -d 0 -s 2 -v 1
msg_ok "OK"

killall Dock
