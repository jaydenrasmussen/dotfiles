#!/usr/bin/env bash

# devtools
bash devtools.sh

echo "----------------------------------------------------"
echo "              Initiating Security Protocols         "
echo "----------------------------------------------------"
export secapps=(
    exiftool
    ffmpeg
    gnupg
    gpg-suite
    nmap
    wireshark
    youtube-dl
)
brew install ${secapps[@]}

echo "----------------------------------------------------"
echo "                 Installing Applications            "
echo "----------------------------------------------------"
export apps=(
    adapter
    appcleaner
    caffeine
    discord
    dropbox
    dupeguru
    etcher
    evernote
    firefox
    flash
    gitup
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
    qlimagesize
    qlmarkdown
    qlstephen
    quicklook-json
    slack
    smcfancontrol
    spotify
    sublime-text
    transmission
    unetbootin
    veracrypt
    virtualbox
    virtualbox-extension-pack
    vlc
)
brew cask install ${apps[@]}
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
