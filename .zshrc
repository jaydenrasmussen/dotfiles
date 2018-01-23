export ZSH=/Users/jaydenrasmussen/.oh-my-zsh

ZSH_THEME=""

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Init pure
autoload -U promptinit; promptinit; prompt pure

# NVM DIR
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

# ALIAS
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv $HOME/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
# Convert line endings to UNIX
alias dos2unix="perl -pi -e 's/\r\n?/\n/g'"
# My IP
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done
alias ax="chmod a+x"
alias yget="cd ~/Downloads/youtube-dl && youtube-dl --extract-audio --audio-format mp3"
alias bump="brew update && brew upgrade && brew cleanup"
alias compile="./compile.sh"
alias run="./run.sh"
alias compile="g++ -std=c++14"
alias start_mongo="mongod --dbpath /Volumes/Scratch/Mongo/db"
export PATH="/usr/local/opt/libpcap/bin:$PATH"
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
