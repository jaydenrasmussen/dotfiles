#!/usr/bin/env bash

# devtools
bash devtools.sh

echo "----------------------------------------------------"
echo "              Initiating Security Protocols         "
echo "----------------------------------------------------"

brew install git wireshark wget python nmap exiftool gnupg ffmpeg youtube-dl
brew cleanup

echo "----------------------------------------------------"
echo "                 Installing Applications            "
echo "----------------------------------------------------"
brew install caskroom/cask/brew-cask
brew cask install adapter appcleaner caffeine discord dropbox etcher evernote firefox flash go2shell google-chrome google-play-music-desktop-player hermes itsycal keka notational-velocity notion onyx qlcolorcode qlmarkdown qlstephen slack smcfancontrol spotify sublime-text transmission unetbootin veracrypt virtualbox virtualbox-extension-pack vlc
brew cask cleanup

# macos
bash macos.sh

echo  -e "\n\n\nAll clear\n\n\n"
read -n1 -r -p "Press space to reboot..." key
if [ "$key" = '' ]; then
    sudo shutdown -r now
    exit
else
    exit
fi
