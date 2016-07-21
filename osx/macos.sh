# # #!/bin/bash

# # # Get Root!
# sudo -v

# # # Keep Alive
# # # Courtesy of https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# # Set computer name (as done via System Preferences → Sharing)
# #sudo scutil --set ComputerName "0x6D746873"
# #sudo scutil --set HostName "0x6D746873"
# #sudo scutil --set LocalHostName "0x6D746873"
# #sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"

# # # Disabe the boot sounds
# sudo nvram SystemAudioVolume=" "

# # # Restart automatically if the computer freezes
# sudo systemsetup -setrestartfreeze on

# # # Reveal IP address, hostname, OS version, etc. when clicking the clock
# sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# # # Disable the sudden motion sensor as it’s not useful for SSDs
# sudo pmset -a sms 0

# # Menu bar: hide the Time Machine, Volume, and User icons
# for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
# 	defaults write "${domain}" dontAutoLoad -array \
# 		"/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
# 		"/System/Library/CoreServices/Menu Extras/Volume.menu" \
# 		"/System/Library/CoreServices/Menu Extras/User.menu"
# done
# defaults write com.apple.systemuiserver menuExtras -array \
# 	"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
# 	"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
# 	"/System/Library/CoreServices/Menu Extras/Battery.menu" \
# 	"/System/Library/CoreServices/Menu Extras/Clock.menu"


# # Increase window resize speed for Cocoa applications
# defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# # Disable the “Are you sure you want to open this application?” dialog
# #defaults write com.apple.LaunchServices LSQuarantine -bool false

# # Reveal IP address, hostname, OS version, etc. when clicking the clock
# # in the login window

# # Disable Notification Center and remove the menu bar icon
# #launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# ###############################################################################
# # SSD-specific tweaks                                                         #
# ###############################################################################

# # Disable hibernation (speeds up entering sleep mode)
# sudo pmset -a hibernatemode 0

# # Disable the sudden motion sensor as it’s not useful for SSDs
# sudo pmset -a sms 0

# ###############################################################################
# # Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
# ###############################################################################

# # Trackpad: enable tap to click for this user and for the login screen
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# # Trackpad: map bottom right corner to right-click
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# # Disable “natural” (Lion-style) scrolling
# defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# # Increase sound quality for Bluetooth headphones/headsets
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# # Enable full keyboard access for all controls
# # (e.g. enable Tab in modal dialogs)
# defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# # Use scroll gesture with the Ctrl (^) modifier key to zoom
# defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# # Follow the keyboard focus while zoomed in
# defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# # Disable press-and-hold for keys in favor of key repeat
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# # Set a blazingly fast keyboard repeat rate
# defaults write NSGlobalDomain KeyRepeat -int 0

# # Set language and text formats
# # Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# # `Inches`, `en_GB` with `en_US`, and `true` with `false`.
# defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
# defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"
# defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
# defaults write NSGlobalDomain AppleMetricUnits -bool true

# # Set the timezone; see `sudo systemsetup -listtimezones` for other values
# sudo systemsetup -settimezone "Europe/Brussels" > /dev/null

# # Disable auto-correct
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# # Stop iTunes from responding to the keyboard media keys
# #launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# ###############################################################################
# # Screen                                                                      #
# ###############################################################################

# # Require password immediately after sleep or screen saver begins
# defaults write com.apple.screensaver askForPassword -int 1
# defaults write com.apple.screensaver askForPasswordDelay -int 0

# # Save screenshots to the desktop
# defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
# defaults write com.apple.screencapture type -string "png"
