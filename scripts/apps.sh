echo "installing userland applications"
declare apps=(
    adapter
    appcleaner
    balenaetcher
    battle-net
    burn
    clipy
    discord
    docker
    dropbox
    dupeguru
    evernote
    firefox
    flash-player
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
    oracle-jdk
    osxfuse
    postman
    qlcolorcode
    qlimagesize
    qlmarkdown
    qlstephen
    quicklook-json
    sketch
    slack
    smcfancontrol
    spotify
    steam
    sublime-merge
    sublime-text
    teamviewer
    the-unarchiver
    typora
    unetbootin
    veracrypt
    virtualbox
    virtualbox-extension-pack
    vlc
    wine-stable
    xquartz
    zoomus
)
brew cask install "${apps[@]}"
echo "done!"
printf "Installing Apps from the app store\n"
declare appstoreapps=(
    937984704
)
mas install "${appstoreapps[@]}"
