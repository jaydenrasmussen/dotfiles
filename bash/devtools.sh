echo "----------------------------------------------------"
echo "                                                    "
echo "                Initiating Dev Environment          "
echo "                                                    "
echo "----------------------------------------------------"

# xcode cli
sudo xcodebuild -license
xcode-select --install

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install coreutils
brew tap aws/tap
brew tap caskroom/cask
brew tap caskroom/fonts

brew update
brew upgrade
export devapps=(
    automake
    awscli
    aws-sam-cli
    cmake
    composer
    docker
    git
    go
    heroku
    kubeless
    kubernetes-cli
    m-cli
    mongohub
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
brew install ${devapps[@]}
brew cask install docker

export fonts=(
    font-inter-ui
    font-roboto
    font-roboto-mono
    font-roboto-condensed
    font-roboto-mono-slab
)
brew tap caskroom/fonts
brew cask install ${fonts[@]}

brew cleanup

composer global require laravel/valet
~/.composer/vendor/bin/valet install
mkdir ~/Valet && cd ~/Valet
valet park

# Node tooling
nvm install lts/*
npm i -g mocha glide prettier pkg ava
# Create the Git folder and environment
mkdir ~/Projects
ln -s ../.gitignore ~/.gitignore

# Make the terminal actually useful
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -rf ~/.zshrc
sudo ln -s ../.zshrc ~/.zshrc
npm i -g pure-prompt
open ../Snazzy.terminal

exit;
