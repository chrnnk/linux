# wget -O - https://raw.githubusercontent.com/chrxnn/linux/main/server/2-install-apps.sh | bash
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y sudo apt install nala -y && sudo apt install qemu-guest-agent -y
mkdir ~/github
cd ~/github
git clone https://github.com/chrxnn/linux
# chmod +x ./linux/bash/setup.sh
# ./linux/bash/setup.sh
# sudo nala fetch
