#!/usr/bin/env bash

set -e

echo "Checking for existing SSH keys"
echo `ls -al ~/.ssh`
if [ -e ~/.ssh/*.pub ]; then
  echo "SSH key arleady exist!"
  exit 0
fi

echo "Generate a new SSH key"
read -p "Please write your e-mail address for ssh key:" mailaddr
# ssh-keygen -t rsa -b 4096 -C "$mailaddr"

echo "Start the ssh-agent in the background"
eval "$(ssh-agent -s)"

if [ -e ~/.ssh/id_rsa ]; then
  echo "Do you want to add your SSH private key to the ssh-agent?(Y/n)"
fi

echo "Adding a new SSH key to your Github account"
sudo apt install xclip
xclip -o -sel clip < ~/.ssh/id_rsa.pub
echo "Copyed the SSH key to your clipboard"
echo "You can visit: https://github.com/settings/keys to add your SSH key"


