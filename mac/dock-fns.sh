#!/usr/bin/env bash

# ./dock - contributed by @rpavlick
# https://github.com/rpavlick/add_to_dock

function add_app_to_dock {
  # adds an application to macOS Dock
  # usage: add_app_to_dock "Application Name"
  # example add_app_to_dock "Terminal"

  app_name="${1}"
  launchservices_path="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"
  app_path=$(${launchservices_path} -dump | grep -o "/.*${app_name}.app" | grep -v -E "Backups|Caches|TimeMachine|Temporary|/Volumes/${app_name}" | uniq | sort | head -n1)
  if open -Ra "${app_path}"; then
      echo "$app_path added to the Dock."
      defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${app_path}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
  else
      echo "ERROR: $1 not found." 1>&2
  fi
}

function add_spacer_to_dock {
  # adds an empty space to macOS Dock

  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
}

function clear_apps_from_dock {
    defaults delete com.apple.dock persistent-apps
}

function clear_others_from_dock {
    defaults delete com.apple.dock persistent-others
}

function clear_dock {
  	clear_apps_from_dock
    clear_others_from_dock
}

function disable_recent_apps_from_dock {
    defaults write com.apple.dock show-recents -bool false
}


function reset_dock {
  # reset macOS Dock to default settings

  defaults write com.apple.dock; killall Dock
}
