#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "installing userland applications"

declare apps=(
    adapter
    appcleaner
    balenaetcher
    battle-net
    clipy
    discord
    docker
    dupeguru
    firefox
    font-roboto
    font-roboto-mono
    go2shell
    google-backup-and-sync
    google-chrome
    hermes
    itsycal
    keka
    kindle
    league-of-legends
    notion
    obs
    onyx
    osxfuse
    postman
    qlcolorcode
    qlimagesize
    qlmarkdown
    qlstephen
    quicklook-json
    sketch
    slack
    spotify
    steam
    sublime-merge
    sublime-text
    the-unarchiver
    typora
    veracrypt
    virtualbox
    virtualbox-extension-pack
    vlc
    wine-stable
    xquartz
    zoomus
)
brew cask install "${apps[@]}"

echo "Installing Apps from the app store"
declare appstoreapps=(
    497799835
    937984704
)
mas install "${appstoreapps[@]}"
