echo "Installing security tools"
declare secapps=(
    exiftool
    ffmpeg
    gnupg
    nmap
    wireshark
    youtube-dl
)
brew install "${secapps[@]}"
echo "done!"

echo "installing userland applications"
declare apps=(
    adapter
    appcleaner
    caffeine
    discord
    dropbox
    dupeguru
    evernote
    firefox
    gitup
    go2shell
    google-chrome
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
    vlc
    zoomus
)
brew cask install "${apps[@]}"
echo "done!"
