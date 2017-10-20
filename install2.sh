#!/usr/bin/env bash
# Clean Slate Protocol
say "Initiating clean slate protocol..."
sleep 10s
clear
echo " ================================= "
echo " --------------------------------- "
echo " "
echo "  INITIATING CLEAN SLATE PROTOCOL  "
echo " "
echo " --------------------------------- "
echo " ================================= "
clear
# Agree to license
echo "-----------------------------------"
echo "Installing XCode Command Line Tools"
echo "-----------------------------------"
echo "    Agree to the XCode License     "
echo "-----------------------------------"
sudo xcodebuild -license
# Install the xcode CLT
xcode-select --install
clear
echo "-----------------------------------"
echo "       Installing Oh My Zsh!       "
echo "-----------------------------------"

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
clear
echo "-----------------------------------"
echo "        Installing Homebrew        "
echo "-----------------------------------"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Clean up
clear
echo "-----------------------------------"
echo "         Installing packages       "
echo "-----------------------------------"
brew update
brew upgrade
sleep 5s
clear
echo "-----------------------------------"
echo "         Security Protocols        "
echo "-----------------------------------"

brew install wireshark
brew install wget
brew install git
brew install python
brew install nmap
brew install exiftool
brew install gnupg
brew cleanup
sleep 5s
clear
echo "-----------------------------------"
echo "       Installing Applications     "
echo "-----------------------------------"
brew install caskroom/cask/brew-cask
brew install node
brew install go
brew install python3
brew install youtube-dl
brew install ffmpeg

brew cask install adapter
brew cask install appcleaner
brew cask install caffeine
brew cask install discord
brew cask install dropbox
brew cask install evernote
brew cask install flash
brew cask install go2shell
brew cask install google-chrome
brew cask install google-play-music-desktop-player
brew cask install hermes
brew cask install itsycal
brew cask install keka
brew cask install notational-velocity
brew cask install notion
brew cask install onyx
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install slack
brew cask install smcfancontrol
brew cask install spotify
brew cask install transmission
brew cask install unetbootin
brew cask install veracrypt
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vlc
brew cask cleanup
brew cleanup
sleep 5s
clear

echo "-----------------------------------"
echo "            Applying UI            "
echo "-----------------------------------"

echo ""
sleep 5s
# Hide User and Time Machine from MenuBar
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
  defaults write "${domain}" dontAutoLoad -array \
    "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
    "/System/Library/CoreServices/Menu Extras/User.menu"
done
defaults write com.apple.systemuiserver menuExtras -array \
  "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
  "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
  "/System/Library/CoreServices/Menu Extras/Battery.menu" \
  "/System/Library/CoreServices/Menu Extras/Clock.menu"
# Disable Gatekeeper
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Disable Launchpad
sudo rm -rf /Applications/Launchpad.app
# Expand Save Panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# Save to disk by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# Show all File extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show Volumes on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# Allow Text selection in quicklook
defaults write com.apple.finder QLEnableTextSelection -bool true
# Disable Warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# No .DS_Store on remote volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# No Local Time Machine Backups
hash tmutil &> /dev/null && sudo tmutil disablelocal
# Don't use new Hard Drives for Time Machine
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
# Set Dock Auto-hide and no Auto-hide delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
# Enable font-smoothing on non-apple displays
defaults write NSGlobalDomain AppleFontSmoothing -int 2
# Ask for password immediately after sleep or screensaver
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
# Disable sudden motion sensor
sudo pmset -a sms 0
# Increase Bluetooth Audio Quality
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
# Delete Notification Center
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
killall NotificationCenter

read -n1 -r -p "Press space to reboot..." key
if [ "$key" = '' ]; then
    sudo shutdown -r now
    exit
else
    exit
fi
