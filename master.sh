#!/bin/bash

mkdir ~/.emacs.d ~/.hammerspoon
cp ~/OSX-Dotfiles/emacs/*.el ~/.emacs.d/
cp ~/OSX-Dotfiles/hammerspoon/* ~/.hammerspoon/
cp ~/OSX-Dotfiles/bash/.bash* ~/
sh ~/OSX-Dotfiles/macos/brew.sh

