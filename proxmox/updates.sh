#!
# ttek's PVE7 post install script
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-install-v3.sh)"
# ttek's LXC updater
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/update-lxcs.sh)"
# linux update all
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
