#!/bin/bash

# Create a gpg key given a name and email, without a passphrase.
# USAGE: gen_key.sh "Marty McFly" "marty@mcfly.com"

if [ -z $1 ] || [ -z $2 ]; then
    echo "USAGE: gen_gpg_key.sh \"Real Name\" \"Email\""
    exit 1
fi

gpg --batch --generate-key <<EOF
     %echo Generating a basic OpenPGP key
     %no-protection
     Key-Type: default
     Key-Length: 4096
     Name-Real: "${1}"
     Name-Comment: General Purpose
     Name-Email: "${2}"
     Expire-Date: 0
     %commit
     %echo done
EOF

if [ -z "${3}" ]; then
     gpg --armor --export ${2}
else
     gpg --armor --output ${3} --export ${2}
fi
