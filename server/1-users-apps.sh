#!/bin/bash # wget -O - https://raw.githubusercontent.com/chrxnn/linux/main/server/1-users-apps.sh | bash

echo "${USER}  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers

sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
sudo apt install nala -y && sudo apt install qemu-guest-agent -y && sudo apt install neofetch -y
sudo nala fetch --country US

mkdir ~/github
cd ~/github
git clone https://github.com/chrxnn/linux
chmod +x ${HOME}/github/linux/bash/setup.sh
${HOME}/github/linux/bash/setup.sh
