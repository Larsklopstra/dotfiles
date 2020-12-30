#!/bin/bash

echo '🏃 Starting setup...'
echo '--------------------'

sudo apt update

sudo apt upgrade

echo '🐠 Installing Fish and Starship...'
echo '----------------------------------'

sudo apt install fish -y

sudo apt install curl

curl -fsSL https://starship.rs/install.sh | bash

rm ~/.config/fish/config.fish -f

mkdir -p ~/.config/fish

cp ~/dotfiles/dotfiles/config.fish ~/.config/fish/config.fish

chsh -s `which fish`

echo '🐋 Adding current user to docker group...'
echo '-----------------------------------------'

sudo groupadd docker

sudo usermod -aG docker $USER

echo '🤖 Installing dev environment...'
echo '--------------------------------'

sudo apt install nodejs npm php php-cli docker.io -y

echo '🎼 Installing composer...'
echo '-------------------------'

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'c31c1e292ad7be5f49291169c0ac8f683499edddcfd4e42232982d0fd193004208a58ff6f353fde0012d35fdd72bc394') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

sudo mkdir -p /usr/local/bin

sudo mv composer.phar /usr/local/bin/composer

echo 'export PATH="~/.config/composer/vendor/bin:$PATH"' >> ~/.bashrc

echo '🐋 Enabling docker on boot...'
echo '-----------------------------'

sudo systemctl enable docker

echo '🐘 Installing PHP extensions...'
echo '-------------------------------'

sudo apt install php-mbstring php-mysql php-xml php-json php-tokenizer php-ctype php-fileinfo php-zip php-curl php-redis php-intl php-gd -y

echo '🌐 Installing Linux Valet...'
echo '----------------------------'

sudo apt install network-manager libnss3-tools jq xsel -y

composer global require cpriego/valet-linux

sudo systemctl disable apache2

sudo service apache2 stop

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
echo '------------------------------------------------'
