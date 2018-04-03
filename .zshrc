export ZSH=/Users/jaydenrasmussen/.oh-my-zsh
ZSH_THEME=""
plugins=(git)
source $ZSH/oh-my-zsh.sh
# Init pure
autoload -U promptinit; promptinit; prompt pure
# NVM DIR
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
# Ensure that pcap is in the path
export PATH="/usr/local/opt/libpcap/bin:$PATH"

# ALIAS
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv $HOME/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
# Convert line endings to UNIX
alias dos2unix="perl -pi -e 's/\r\n?/\n/g'"
# My IP
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done
# make executable
alias ax="chmod a+x"
# pirate music
alias yget="cd ~/Downloads/youtube-dl && youtube-dl --extract-audio --audio-format mp3"
# update procedure for brew
alias bump="brew update && brew upgrade && brew cleanup"
# for compiling c++ code
alias compile="g++ -std=c++14"
# starting a db
alias start_mongo="mongod --dbpath /Volumes/Scratch/Mongo/db"
# count lines of code
# everything within this comma seperated list should be updated to include new stuff if needed
alias loc="cloc --exclude-dir=node_modules,bin,package.json,yarn.lock,.gitignore,.editorconfig,README.md,LICENSE.md,*.zip ."
# GoPath
cd () {
    builtin cd "$@"
    cdir=$PWD
    while [ "$cdir" != "/" ]; do
        if [ -e "$cdir/.gopath" ]; then
            export GOPATH=$cdir
			export GOBIN=$GOPATH/bin
            break
        fi
        cdir=$(dirname "$cdir")
    done
}
