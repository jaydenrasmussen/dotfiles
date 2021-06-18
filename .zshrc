export ZSH=/Users/jaydenrasmussen/.oh-my-zsh
ZSH_THEME=""
plugins=(git sublime)
source $ZSH/oh-my-zsh.sh
eval $(thefuck --alias)
# Init pure
autoload -U promptinit; promptinit; prompt pure
# NVM DIR
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
# Ensure that pcap is in the path
export PATH="/usr/local/opt/libpcap/bin:$PATH"
export PATH="~/.composer/vendor/bin:$PATH"
export GOPATH=~/Go
# ALIAS
# Containers
alias k="kubectl"
alias kaf="kubectl apply -f"
alias kdf="kubectl delete -f"
alias kg="kubectl get"
alias kgp="kubectl get pods"
alias kgpa="kubectl get pods -A"
alias kd="kubectl describe"
kubeshell() {
  if [[ -z $2 ]]; then
    kubectl run $1  --rm -i --tty --image bitnami/minideb:buster -- bash
  else
    kubectl run $1 -n $2  --rm -i --tty --image bitnami/minideb:buster -- bash
  fi
}

alias dk="docker"
alias dkps="docker ps"
alias dkpsa="docker ps -a"
alias dkia="docker images -a"
alias dki="docker images"
alias dkb="docker build"

alias dkc="docker-compose"
alias dkcu="docker-compose up"
alias dkcd="docker-compose down"

alias mkdirp="mkdir -p"
# Terraform
alias tf="terraform"
alias tfi="terraform init"
alias tfw="terraform workspace"
alias tfws="terraform workspace show"
alias tfp="terraform plan"
alias tfa="terraform apply"
alias tfaa="terraform apply -auto-approve"
alias tfd="terraform destroy"
alias tfda="terraform destroy -auto-approve"

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
resize_photos() {
  # Make directories
  mkdir -p "$1/320" "$1/640" "$1/960" "$1/1280" "$1/1600" "$1/1920"
  # Resize and compress
  mogrify -quality "85%" -resize 320 -filter Lanczos -interlace Plane -sampling-factor 4:2:0 -strip -interlace JPEG -colorspace sRGB -path "$1/320" "$1/*.jpg"
  mogrify -quality "85%" -resize 640 -filter Lanczos -interlace Plane -sampling-factor 4:2:0 -strip -interlace JPEG -colorspace sRGB -path "$1/640" "$1/*.jpg"
  mogrify -quality "85%" -resize 960 -filter Lanczos -interlace Plane -sampling-factor 4:2:0 -strip -interlace JPEG -colorspace sRGB -path "$1/960" "$1/*.jpg"
  mogrify -quality "85%" -resize 1280 -filter Lanczos -interlace Plane -sampling-factor 4:2:0 -strip -interlace JPEG -colorspace sRGB -path "$1/1280" "$1/*.jpg"
  mogrify -quality "85%" -resize 1600 -filter Lanczos -interlace Plane -sampling-factor 4:2:0 -strip -interlace JPEG -colorspace sRGB -path "$1/1600" "$1/*.jpg"
  mogrify -quality "85%" -resize 1920 -filter Lanczos -interlace Plane -sampling-factor 4:2:0 -strip -interlace JPEG -colorspace sRGB -path "$1/1920" "$1/*.jpg"
}
# count lines of code
# everything within this comma seperated list should be updated to include new stuff if needed
alias loc="cloc --exclude-dir=node_modules,bin,package.json,yarn.lock,.gitignore,.editorconfig,README.md,LICENSE.md,*.zip,*.tar.gz,*.tar ."

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/jaydenrasmussen/Projects/cs3750_group4/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/jaydenrasmussen/Projects/cs3750_group4/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/jaydenrasmussen/Projects/cs3750_group4/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/jaydenrasmussen/Projects/cs3750_group4/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/jaydenrasmussen/Projects/cs3750_group4/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/jaydenrasmussen/Projects/cs3750_group4/node_modules/tabtab/.completions/slss.zsh
alias pip= /usr/local/bin/pip3
alias python=/usr/local/bin/python3

export PATH="/usr/local/opt/ruby/bin:$PATH"
eval "$(pyenv init -)"
