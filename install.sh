#!/bin/bash

echo '🏃 Starting setup...'
echo '--------------------'

sudo apt update

sudo apt upgrade

echo '🐠 Installing Fish and Starship...'
echo '----------------------------------'

sudo apt install fish -y

sudo snap install starship

rm ~/.config/fish/config.fish -f

mkdir -p ~/.config/fish

cp ~/dotfiles/config.fish ~/.config/fish/config.fish

chsh -s `which fish`

echo '🐋 Adding current user to docker group...'
echo '-----------------------------------------'

sudo groupadd docker

sudo usermod -aG docker $USER

echo '🤖 Installing dev environment...'
echo '--------------------------------'

sudo apt install nodejs php php-cli composer docker.io -y

echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc

source ~/.bashrc

echo '🐋 Enabling docker on boot...'
echo '-----------------------------'

sudo systemctl enable docker

echo '🐘 Installing PHP extensions...'
echo '-------------------------------'

sudo apt install php-mbstring php-mysql php-xml php-json php-tokenizer php-ctype php-fileinfo php-zip php-curl -y

echo '🌐 Installing Linux Valet...'
echo '----------------------------'

sudo apt install network-manager libnss3-tools jq xsel -y

composer global require cpriego/valet-linux

sudo systemctl disable apache2

sudo service apache2 stop

valet install

mkdir ~/Sites

cd ~/Sites

valet park

echo '💾 Installing Takeout...'
echo '------------------------'

composer global require tightenco/takeout

echo '📦 Installing Laravel installer...'
echo '----------------------------------'

composer global require laravel/installer

echo '📦 Installing Statamic installer...'
echo '-----------------------------------'

composer global require statamic/cli

echo '🌲 Setting up git...'
echo '--------------------'

echo 'What is your name?'

read name

git config --global user.name "$name"

echo 'What is your email address?'

read email

git config --global user.email $email 

echo '🔑 Generating SSH keys...'
echo '-------------------------'

ssh-keygen -t ed25519

echo '🎉 You are now ready to create awesome software!'
echo '-----------------------------------------------'
