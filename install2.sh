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
# Install Homebrew
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
brew cleanup
sleep 5s
clear
echo "-----------------------------------"
echo "       Installing Applications     "
echo "-----------------------------------"
brew install caskroom/cask/brew-cask

apps=(
        adapter
        appcleaner
        caffeine
        discord
        dropbox
        evernote
        flash
        go2shell
        google-chrome
        google-play-music-desktop-player
        hermes
        itsycal
        keka
        notational-velocity
        notion
        onyx
        qlcolorcode
        qlmarkdown
        qlstephen
        slack
        smcfancontrol
        spotify
        transmission
        unetbootin
        veracrypt
        virtualbox
        virtualbox-extension-pack
        vlc
)

brew cask install --appdir="/Applications" ${apps[@]}
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

echo "----------------------------------"
echo "           BASH PROFILING         "
echo "----------------------------------"
echo ""
echo"Add the following to the file, save"
echo " and quit"
echo ""
echo "alias mirror='wget -e robots=off -m -r -np'"
echo "alias killDS='find . -name *.DS_Store -type f -delete'"
echo "alias killfinder='killAll Finder'"

read -n1 -r -p "Press space to reboot..." key
if [ "$key" = '' ]; then
    shutdown -r now
    exit
else
    exit
fi
