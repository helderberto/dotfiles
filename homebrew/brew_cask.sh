#!/bin/bash

# To maintain cask ....
# brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`

# Install native apps

# productivity
brew cask install 1password
brew cask install google-chrome
brew cask install spotify
brew cask install notion
brew cask install pomodone

# dev
brew cask install iterm2
brew cask install visual-studio-code
brew cask install insomnia
brew cask install imageoptim

# design
brew cask install figma

# communication
brew cask install slack

# fonts
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-hack
brew cask install font-open-sans
brew cask install font-roboto
