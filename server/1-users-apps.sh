#!/bin/bash # wget -O - https://raw.githubusercontent.com/chrxnn/linux/main/server/1-users-apps.sh | bash
RC='\e[0m'
RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'

echo -e "${GREEN}Allowing current user to run sudo without password verification${GITPATH}${RC}"
echo "${USER}  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers

echo -e "${GREEN}Updating everything${GITPATH}${RC}"
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y

echo -e "${GREEN}Installing nala, neofetch, and qemu-guest-agent${GITPATH}${RC}"
sudo apt install nala -y && sudo apt install qemu-guest-agent -y && sudo apt install neofetch -y

# echo -e "${GREEN}Removing motd${GITPATH}${RC}"
# sudo chmod -x /etc/update-motd.d/*

echo -e "${GREEN}Creating ~/github folder${GITPATH}${RC}"
mkdir ~/github
cd ~/github

echo -e "${GREEN}Cloning my linux repo${GITPATH}${RC}"
git clone https://github.com/chrxnn/linux

echo -e "${GREEN}Making my bash setup script executable${GITPATH}${RC}"
chmod +x ${HOME}/github/linux/bash/setup.sh

echo -e "${GREEN}Running my bash setup script${GITPATH}${RC}"
${HOME}/github/linux/bash/setup.sh

echo -e "${GREEN}run sudo nala fetch --country US${GITPATH}${RC}"
