#!/bin/bash

clear

echo \n"Setting up Takeout..."\n

takeout enable redis mysql --default

echo \n"Setting up Laravel Valet..."\n

valet install

mkdir ~/Sites

cd ~/Sites

valet park

echo \n"Setting up git..."\n

echo 'What is your name?'

read name

git config --global user.name "$name"

echo 'What is your email address?'

read email

git config --global user.email $email 

echo \n"Generating SSH keys..."\n

ssh-keygen -t ed25519

clear

echo \n"Installation completed!"\n
