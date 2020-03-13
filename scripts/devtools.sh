#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "----------------------------------------------------"
echo "-                                                  -"
echo "-            Initializing Dev Environment          -"
echo "-                                                  -"
echo "----------------------------------------------------"


echo "Installing dev command line tools"
declare devapps=(
    automake
    awscli
    black
    cfssl
    clang-format
    cloc
    cmake
    composer
    coreutils
    doctl
    docker-compose
    exiftool
    figlet
    git
    git-secret
    git-extras
    gnupg
    go
    highlight
    httpie
    imagemagick
    jq
    kubernetes-cli
    m-cli
    mas
    minikube
    nettle
    nghttp2
    nginx
    nvm
    openshift-cli
    openssl
    packer
    pandoc
    python
    rust
    telnet
    tfenv
    the_silver_searcher
    thefuck
    watch
    wget
)
brew install ${devapps[@]}

echo "----------------------------------------------------"
echo "-                   Configuring git                -"
echo "----------------------------------------------------"

read -p "Email: " email
read -p "Name: " name

git config --global user.name "${name}"
git config --global user.email "${email}"
git config --global core.autocrlf input
git config --global core.safecrlf true
# git squash <hash> <new commit message>
git config --global alias.squash '!f(){ git reset --soft "${1}~" && git add -a && git commit -m "${2}"; };f'
# nicer git log
git config --global alias.lg "log --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)[%ar]%C(reset) %C(white)%s%C(reset) %C(dim white) -%an%C(reset)%C(bold yellow)%d%C(reset)' --all"
# git replay <hash> <message>
git config --global alias.replay '!f(){ git rm -r . && git checkout "${1}" . && git commit -m "${2}"; };f'

echo "----------------------------------------------------"
echo "-                   Linking Dotfiles               -"
echo "----------------------------------------------------"
declare dotfilesToDelete=(
    ~/.clang-format
    ~/.clocignore
    ~/.editorconfig
    ~/.gitignore
)
rm -rf "${dotfilesToDelete[@]}"

ln -s ~/dotfiles/.clang-format ~/.clang-format
ln -s ~/dotfiles/.clocignore ~/.clocignore
ln -s ~/dotfiles/.editorconfig ~/.editorconfig
ln -s ~/dotfiles/.gitignore ~/.gitignore

echo "----------------------------------------------------"
echo "-               Generating a PGP Key               -"
echo "----------------------------------------------------"
~/dotfiles/gen_gpg_key.sh "${name}" "${email}"

echo "----------------------------------------------------"
echo "-               Generating a SSH Key               -"
echo "----------------------------------------------------"
ssh-keygen -b 2048 -t rsa -f "~/.ssh/personal_key" -q -N ""
ssh-add -K ~/.ssh/personal_key
tee ~/.ssh/config <<EOF
Host *
    IdentityFile ~/.ssh/personal_key
    UseKeychain yes
    AddKeysToAgent yes
EOF
