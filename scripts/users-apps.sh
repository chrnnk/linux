#!
# wget -O - https://raw.githubusercontent.com/chrnnk/linux/main/scripts/users-apps.sh | bash
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

echo -e "${Green}Allowing current user to run sudo without password verification${ColorOff}"
echo "${USER}  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers

mkdir ~/.ssh
cd ~/.ssh
touch authorized_keys

echo -e "${Green}Adding my ssh key to authorized keys${ColorOff}"
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMw4F/gxCmCiWdmqLmtPbZTObzzmlwWLh2SosqKdLzZl nick@chrxnn.com" >> ~/.ssh/authorized_keys

echo -e "${Green}Updating everything${ColorOff}"
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y

echo -e "${Green}Installing git, nala ncdu, and neofetch${ColorOff}"
sudo apt install curl neofetch ncdu git -y
# if running in a VM
#sudo apt install qemu-guest-agent -y

echo -e "${Green}Installing tailscale${ColorOff}"
curl -fsSL https://tailscale.com/install.sh | sh

echo -e "${Green}Creating ~/github folder${ColorOff}"
mkdir ~/github
cd ~/github

echo -e "${Green}Cloning my linux repo${ColorOff}"
git clone https://github.com/chrnnk/linux

echo -e "${Green}Cloning my docker repo${ColorOff}"
git clone https://github.com/chrnnk/docker

echo -e "${Green}Cloning our app-icon repo, mapping it to ~/docker/app-icons${ColorOff}"
git clone https://github.com/housefisharr/app-icons

echo -e "${Green}Making my bash setup script executable${ColorOff}"
chmod +x ${HOME}/github/linux/customization/bash/setup.sh

echo -e "${Green}Running my bash setup script${ColorOff}"
~/github/linux/customization/bash/setup.sh
