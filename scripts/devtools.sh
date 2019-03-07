echo "\n"
echo "----------------------------------------------------"
echo "-                                                  -"
echo "-               Initiating Dev Environment         -"
echo "-                                                  -"
echo "----------------------------------------------------"

# xcode cli
echo "Installing built-in tools"
sudo xcodebuild -license
xcode-select --install

read -n 1 -s -r -p "Press any key to continue"

# # Homebrew
echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
echo "done!"

echo "Adding repos to homebrew"
declare taps=(
    aws/tap
    caskroom/cask
    caskroom/fonts
)
brew tap "${taps[@]}" &> /dev/null
echo "done!"

echo "Installing dev command line tools"
declare devapps=(
    automake
    awscli
    aws-sam-cli
    clang-format
    cmake
    composer
    coreutils
    docker
    git
    go
    kubeless
    kubernetes-cli
    m-cli
    nvm
    openshift-cli
    php@7.2
    openssl
    python
    rust
    telnet
    the_silver_searcher
    thefuck
    wget
    yarn
)
brew install ${devapps[@]} &> /dev/null
echo "Installing Docker"
brew cask install docker &> /dev/null
echo "done!"

declare fonts=(
    font-inter-ui
sassread email
git config --global user.email "${email}"
git config --global core.autocrlf input
git config --global core.safecrlf true
# git squash <hash> <new commit message>
git config --global alias.squash '!f(){ git reset --soft "${1}~" && git add -a && git commit -m "${2}"; };f'
# nicer git log
git config --global alias.lg "log --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)[%ar]%C(reset) %C(white)%s%C(reset) %C(dim white) -%an%C(reset)%C(bold yellow)%d%C(reset)' --all"
# git replay <hash> <message>
git config --global alias.replay '!f(){ git rm -r . && git checkout "${1}" . && git commit -m "${2}"; };f'

echo "Linking dotfiles"
declare dotfilesToDelete=(
    ~/.clang-format
    ~/.clocignore
    ~/.editorconfig
    ~/.gitignore
)
rm -rf "${dotfilesToDelete}"
ln -s ~/dotfiles/.clang-format ~/.clang-format
ln -s ~/dotfiles/.clocignore ~/.clocignore
ln -s ~/dotfiles/.editorconfig ~/.editorconfig
ln -s ~/dotfiles/.gitignore ~/.gitignore
echo "done!"
