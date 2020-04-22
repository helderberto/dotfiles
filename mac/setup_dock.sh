#!/usr/bin/env bash

source ./dock_utils.sh

# WARNING: permanently clears existing dock
clear_dock
disable_recent_apps_from_dock

add_app_to_dock "Google Chrome"
add_app_to_dock "Visual Studio Code"
add_app_to_dock "iTerm"
add_app_to_dock "Todoist"
add_app_to_dock "Bear"
add_app_to_dock "Slack"
add_app_to_dock "PomoDoneApp"
add_app_to_dock "Spotify"
add_app_to_dock "DevDocs"
add_folder_to_dock $HOME/Downloads -d 0 -s 2 -v 1

killall Dock
