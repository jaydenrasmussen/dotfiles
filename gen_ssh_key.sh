#!/bin/bash

# Create an SSH Keypair in the location provided
# USAGE: gen_ssh_key.sh ./my_key.rsa "passphrase"

if [ -z $1 ]; then
    echo "USAGE: gen_ssh_key.sh <key location> \"passphrase\""
    exit 1
fi

ssh-keygen -b 2048 -t rsa -f "${1}" -q -N "${2}"

echo "Keys output to ${1} and ${1}.pub"
echo "Add them to ssh-agent with the following: ssh-add -K ${1}"
echo "Autoload them into ssh with the following:"
printf "tee ~/.ssh/config <<EOF
Host *
    IdentityFile ${1}
    UseKeychain yes
    AddKeysToAgent yes
EOF\n"
