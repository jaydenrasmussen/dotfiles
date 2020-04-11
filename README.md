# Dotfiles

This repo contains a number of really useful scripts for setting up a new machine 

### tl;dr

```bash
curl -L https://git.io/JvhBC | bash
```

### Usage

You can use these scripts individually and customize them to your own needs, or you can use them holistically with the install script.

#### gen_ssh_key.sh

This file will takes two arguments `path` and `passphrase` to output an ssh key. Using the path argument you can generate a new ssh key at the location you provide by giving it an absolute path and filename for the key for example `gen_ssh_key.sh ~/.ssh/my_new_key` it will output a `.pub` and the private key itself.

#### gen_gpg_key.sh

This file will generate a new pgp key given a `real_name` and `email` and add it to the gpg keychain automatically. Note: ***By default it generates keys without an expiration date***. 

#### devtools.sh

This file sets up your development environment by way of setting up your git config and then by linking the local dot files to the home directory for use.

