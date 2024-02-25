# https://github.com/jiangcuo/Proxmox-Port/wiki/Install-Proxmox-VE-on-Debian-bookworm
# set root password, delete user
sudo passwd root
sudo su
userdel -r nick
# allow root login
nano /etc/ssh/sshd_config
# set static ip with nmcli
nmcli connection modify 'Wired connection 1' ipv4.address IPADDRESS/24
nmcli connection modify 'Wired connection 1' ipv4.gateway GATEWAY
nmcli connection modify 'Wired connection 1' ipv4.method manual
nmcli connection modify 'Wired connection 1' ipv4.dns 'GATEWAY'
nmcli connection down 'Wired connection 1' && nmcli connection up 'Wired connection 1'
# or set static ip with nmtui
nmtui
# set hostname
nano /etc/hostname
nano /etc/hosts
# mirrors
echo 'deb [arch=arm64] https://mirrors.apqa.cn/proxmox/debian/pve bookworm port'>/etc/apt/sources.list.d/pveport.list
curl https://mirrors.apqa.cn/proxmox/debian/pveport.gpg -o /etc/apt/trusted.gpg.d/pveport.gpg 
# update and install
apt update && apt full-upgrade -y
apt install ifupdown2 -y
apt install proxmox-ve postfix open-iscsi -y
reboot
apt update && apt full-upgrade -y
pveam update
# create bridge in proxmox gui
# tteck scripts
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-pve-install.sh)"
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/kernel-clean.sh)"
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/scaling-governor.sh)"
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/cron-update-lxcs.sh)"
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/netdata.sh)"
# run lxc
# https://github.com/jiangcuo/Proxmox-Port/issues/3
# Create the debian lxc/ct, select static on the network tab and leave it blank.
# Start the lxc and login, should be unable to get an IP address
ip -c a
# run the following command to get an IP address
dhclient
apt update
# to install ifupdown2 package, Note: if this doesn't work out try "apt install ifupdown"
apt install ifupdown2 -y
apt upgrade -y