#!/usr/bin/env bash
set -e

add_app_to_dock() {
  local app_name="${1}"
  local launchservices_path="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"
  local app_path
  app_path=$(${launchservices_path} -dump | grep -o "/.*${app_name}.app" | grep -v -E "Backups|Caches|TimeMachine|Temporary|/Volumes/${app_name}" | uniq | sort | head -n1)
  if open -Ra "${app_path}" 2>/dev/null; then
    defaults write com.apple.dock persistent-apps -array-add \
      "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${app_path}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
  else
    echo "WARN: ${app_name} not found, skipping"
  fi
}

add_folder_to_dock() {
  local folder_path="${1}"
  local sortby="2" displayas="0" viewcontentas="1"
  if [ -d "${folder_path}" ]; then
    defaults write com.apple.dock persistent-others -array-add \
      "<dict><key>tile-data</key><dict><key>arrangement</key><integer>${sortby}</integer><key>displayas</key><integer>${displayas}</integer><key>file-data</key><dict><key>_CFURLString</key><string>file://${folder_path}</string><key>_CFURLStringType</key><integer>15</integer></dict><key>file-type</key><integer>2</integer><key>showas</key><integer>${viewcontentas}</integer></dict><key>tile-type</key><string>directory-tile</string></dict>"
  fi
}

defaults delete com.apple.dock persistent-apps 2>/dev/null || true
defaults delete com.apple.dock persistent-others 2>/dev/null || true
defaults write com.apple.dock show-recents -bool false

add_app_to_dock "Chrome"
add_app_to_dock "Ghostty"
add_app_to_dock "Cursor"
add_app_to_dock "Obsidian"
add_app_to_dock "Slack"
add_app_to_dock "Spotify"
add_folder_to_dock "$HOME/Downloads"

killall Dock
