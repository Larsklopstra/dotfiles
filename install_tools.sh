#!/bin/bash

clear

cd ~/Downloads

echo \n"Installing Code..."\n

curl -Lo ./code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

dpki -i code.deb

rm code.deb

echo \n"Installing Insomnia Core..."\n

curl -Lo ./insomnia.deb "https://updates.insomnia.rest/downloads/ubuntu/latest"

dpki -i ./insomnia.deb

rm insomnia.deb

echo \n"Installing Notable..."\n

curl -Lo ./notable.deb "https://download.notable.app?target=deb"

dpki -i ./notable.deb

rm notable.deb

clear

echo \n"All tools installed!"\n
