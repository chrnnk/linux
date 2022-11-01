#!/bin/bash # wget -O - https://raw.githubusercontent.com/chrxnn/linux/main/server/1-users-apps.sh | bash

ColorOff='\033[0m'       # Text Reset
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

EC='\e[0m'
RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'
PURPLE='\e[35m'

echo -e "${Green}Allowing current user to run sudo without password verification${GITPATH}${ColorOff}"
echo -e "${Green}echo "$\{USER\}  ALL=\(ALL\) NOPASSWD:ALL" | sudo tee /etc/sudoers${ColorOff}"
echo "${USER}  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers

echo -e "${Green}Updating everything${GITPATH}${ColorOff}"
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
pause
echo -e "${Green}Installing nala, neofetch, and qemu-guest-agent${GITPATH}${ColorOff}"
sudo apt install nala -y && sudo apt install qemu-guest-agent -y && sudo apt install neofetch -y

sudo dmidecode -s system-manufacturer

# echo -e "${Green}Removing motd${GITPATH}${ColorOff}"
# sudo chmod -x /etc/update-motd.d/*

echo -e "${Green}Creating ~/github folder${GITPATH}${ColorOff}"
mkdir ~/github
cd ~/github

echo -e "${Green}Cloning my linux repo${GITPATH}${ColorOff}"
git clone https://github.com/chrxnn/linux

echo -e "${Green}Making my bash setup script executable${GITPATH}${ColorOff}"
chmod +x ${HOME}/github/linux/bash/setup.sh

echo -e "${Green}Running my bash setup script${GITPATH}${ColorOff}"
${HOME}/github/linux/bash/setup.sh

echo -e "${Green}run sudo nala fetch --country US${GITPATH}${ColorOff}"
