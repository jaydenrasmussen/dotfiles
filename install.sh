#!/usr/bin/env bash
echo "!!! STOP! Before you run this file make sure you have everything installed at ~/dotfiles !!!"
echo "-- Welcome to a fresh new installation! --";
echo "We are currently running in $SHELL"

bash ./scripts/devtools.sh
# bash ./scripts/apps.sh
# bash ./scripts/macos.sh
#
echo "Making the terminal useful..."
# # Make the terminal actually useful
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo ln -s ~/dotfiles/.zshrc ~/.zshrc
npm i -g pure-prompt

echo  -e "\n\n\nFinished Installing\n\n\n"
read -n 1 -r -p "Press space to reboot..." key
if [ "$key" = '' ]; then
    echo "rebooting..."
    sudo shutdown -r now
    exit
else
    exit
fi
