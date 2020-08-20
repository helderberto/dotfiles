#!/usr/bin/env bash

source ./utils.sh

# WARNING: permanently clears existing dock
clear_dock
disable_recent_apps_from_dock

add_app_to_dock "Emacs"
add_app_to_dock "Alacritty"
add_app_to_dock "iTerm"
add_app_to_dock "Slack"
add_app_to_dock "Spotify"
add_folder_to_dock $HOME/Downloads -d 0 -s 2 -v 1

killall Dock
