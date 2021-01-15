#!/bin/bash

clear

echo \n"Starting setup..."\n

sudo apt update

sudo apt upgrade

echo \n"Setting up shell..."\n

sudo apt install fish -y

sudo apt install curl

curl -fsSL https://starship.rs/install.sh | bash

rm ~/.config/fish/config.fish -f

mkdir -p ~/.config/fish

cp ~/dotfiles/dotfiles/config.fish ~/.config/fish/config.fish

chsh -s `which fish`

echo \n"Adding current user to docker group..."\n

sudo groupadd docker

sudo usermod -aG docker $USER

echo \n"Installing dev environment..."

sudo apt install nodejs npm php php-cli docker.io -y

echo \n"Installing composer..."\n

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

php composer-setup.php

php -r "unlink('composer-setup.php');"

sudo mkdir -p /usr/local/bin

sudo mv composer.phar /usr/local/bin/composer

echo 'export PATH="~/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc

echo \n"Enabling docker on boot..."\n

sudo systemctl enable docker

echo \n"Installing PHP extensions..."\n

sudo apt install php-mbstring php-mysql php-xml php-json php-tokenizer php-ctype php-fileinfo php-zip php-curl php-redis php-intl php-gd -y

echo \n"Installing Linux Valet..."\n

sudo apt install network-manager libnss3-tools jq xsel -y

composer global require cpriego/valet-linux

sudo systemctl disable apache2

sudo service apache2 stop

echo \n"Installing takeout..."\n

composer global require tightenco/takeout

echo \n"Installing Laravel installer..."\n

composer global require laravel/installer

echo \n"Installing Statamic installer..."\n

composer global require statamic/cli

echo \n"A reboot is required, rebooting in 10 seconds..."\n

sleep 10

sudo reboot now
