#!/usr/bin/env bash

source ./mac/dock-fns.sh

# WARNING: permanently clears existing dock
clear_dock
disable_recent_apps_from_dock

add_app_to_dock "System Preferences"
add_app_to_dock "Activity Monitor"
add_app_to_dock "Google Chrome"
add_app_to_dock "Visual Studio Code"
add_app_to_dock "iTerm"
add_app_to_dock "Slack"
add_app_to_dock "Insomnia"
add_app_to_dock "Figma"

killall Dock
