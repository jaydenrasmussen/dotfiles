#!/usr/bin/env bash
clear
echo " ================================= "
echo " --------------------------------- "
echo " "
echo "  INITIATING CLEAN SLATE PROTOCOL  "
echo " "
echo " --------------------------------- "
echo " ================================= "
sleep 5s
clear

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
echo "          Updating Homebrew        "
echo "-----------------------------------"
brew update
brew upgrade
brew cleanup
clear
echo "-----------------------------------"
echo "   Initiating Security Protocols   "
echo "-----------------------------------"

brew install git wireshark wget python nmap exiftool gnupg
clear
echo "-----------------------------------"
echo "      Building Dev Environment     "
echo "-----------------------------------"
brew install nvm
nvm install lts/*
npm i -g mocha yarn glide prettier pkg
brew install go grunt-cli openshift-cli python3 docker kubernetes-cli kubeless
brew cask install docker
cd ~/
mkdir "Git"
cd Git/
git clone https://github.com/jaydenrasmussen/dotfiles.git
cd dotfiles
sudo ln -s ./.zshrc ~/.zshrc
clear
echo "-----------------------------------"
echo "       Installing Applications     "
echo "-----------------------------------"
brew install caskroom/cask/brew-cask
brew cask install adapter
brew cask install appcleaner
brew cask install caffeine
brew cask install discord
brew cask install dropbox
brew cask install etcher
brew cask install evernote
brew cask install firefox
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
brew cask install sublime-text
brew cask install transmission
brew cask install unetbootin
brew cask install veracrypt
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vlc
brew install ffmpeg youtube-dl
brew cask cleanup
brew cleanup
clear

echo "-----------------------------------"
echo "            Applying UI            "
echo "-----------------------------------"

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
# Increase Bluetooth Audio Quality
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
# Delete Notification Center
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
killall NotificationCenter

# Screensaver
cd ~/
wget "http://www.rasmusnielsen.dk/download.php?type=applewatch-screensaver"
unzip "download.php?type=applewatch-screensaver"
open WatchOSX.saver
rm -rf __MACOSX "download.php?type=applewatch-screensaver" WatchOSX.saver

clear
echo  -e "\n\n\nAll clear\n\n\n"
read -n1 -r -p "Press space to reboot..." key
if [ "$key" = '' ]; then
    sudo shutdown -r now
    exit
else
    exit
fi
