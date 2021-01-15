#!/bin/bash

clear

cd ~/Downloads

echo "\nInstalling Code...\n"

curl -oL ./Downloads/code.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64

dpki -i code.deb

rm code.deb

echo "\nInstalling Insomnia Core...\n"

curl -oL ./Downloads/insomnia.deb https://updates.insomnia.rest/downloads/ubuntu/latest

dpki -i ./insomnia.deb

rm insomnia.deb

echo "\nInstalling Notable...\n"

curl -oL ./Downloads/notable.deb https://download.notable.app?target=deb

dpki -i ./notable.deb

rm notable.deb

clear

echo "\nAll tools installed!\n"
