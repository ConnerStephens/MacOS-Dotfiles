#!/bin/bash

# Run with: chmod a+x brew.sh && ./brew.sh

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

xcode-select --install

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Begin the installation!
brew update
brew upgrade

brew install --with-cocoa --srgb emacs
brew install ruby
brew install python3
brew install lua
brew install aspell
brew install ffmpeg
brew install youtube-dl
brew install gnuplot
brew install nasm

brew cask install vmware-fusion
brew cask install vagrant
brew cask install xquartz
brew cask install keka
brew cask install hammerspoon
brew cask install shortcat
brew cask install alfred
brew cask install appcleaner
brew cask install mactex
brew cask install gimp
brew cask install transmission
brew cask install jadengeller-helium
brew cask install flux
brew cask install google-chrome

brew cleanup

sudo -s
echo /usr/local/bin/bash >> /etc/shells
chsh -s /usr/local/bin/bash


