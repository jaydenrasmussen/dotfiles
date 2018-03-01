echo "----------------------------------------------------"
echo "                                                    "
echo "                Initiating Dev Environment          "
echo "                                                    "
echo "----------------------------------------------------"
# Homebrew tooling
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

brew update
brew upgrade

brew install go grunt-cli openshift-cli python3 docker kubernetes-cli kubeless nvm yarn dep automake cmake git heroku openssl rust telnet torus brew install the_silver_searcher
brew cask install docker
brew cleanup
# Node tooling
nvm install lts/*
npm i -g mocha glide prettier pkg ava
# Create the Git folder and environment
mkdir ~/Git
ln -s ../.gitignore ~/.gitignore

# Make the terminal actually useful
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -rf ~/.zshrc
sudo ln -s ../.zshrc ~/.zshrc
npm i -g pure-prompt
open ../Snazzy.terminal

exit;
