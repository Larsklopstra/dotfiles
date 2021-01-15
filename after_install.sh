#!/bin/bash

clear

echo "\nSetting up Takeout...\n"

takeout enable redis mysql --default

echo "\nSetting up Laravel Valet...\n"

valet install

mkdir ~/Sites

cd ~/Sites

valet park

echo "\nSetting up git...\n"

echo 'What is your name?'

read name

git config --global user.name "$name"

echo 'What is your email address?'

read email

git config --global user.email $email 

echo "\nGenerating SSH keys...\n"

ssh-keygen -t ed25519

clear

echo "\nInstallation completed!\n"
