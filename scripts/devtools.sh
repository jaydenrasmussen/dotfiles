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
brew tap "${taps}" &> /dev/null
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
    font-roboto
    font-roboto-mono
    font-roboto-condensed
    font-roboto-mono-slab
)
echo "Installing fonts"
brew cask install ${fonts[@]} &> /dev/null
echo "done!"

brew cleanup &> /dev/null

echo "Installing Valet"
composer global require laravel/valet &> /dev/null &&  \
~/.composer/vendor/bin/valet install &> /dev/null && \
mkdir ~/Valet &> /dev/null && \
cd ~/Valet &> /dev/null && \
valet park &> /dev/null
echo "done!"

cd ~/dotfiles

echo "Installing node 8.*"
# # Node tooling
nvm install lts/carbon &> /dev/null
echo "done!"

# # Create the Git folder and environment
echo "Creating standard project folders"
mkdir -p ~/Projects
mkdir -p ~/Sandbox
echo "done!"

echo "-- Setting up Git environment --\n"
echo -n "Enter the name for git [ENTER]: "
read username
git config --global user.name "${username}"
echo -n "Enter the email to use for git [ENTER]: "
read email
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
