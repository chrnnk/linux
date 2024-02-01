# https://github.com/jiangcuo/Proxmox-Port/wiki/Install-Proxmox-VE-on-Debian-bookworm
userdel -r nick
nmcli connection modify 'Wired connection 1' ipv4.address IPADDRESS/24
nmcli connection modify 'Wired connection 1' ipv4.gateway GATEWAY
nmcli connection modify 'Wired connection 1' ipv4.method manual
nmcli connection modify 'Wired connection 1' ipv4.dns 'GATEWAY'
nmcli connection down 'Wired connection 1' && nmcli connection up 'Wired connection 1'
nano /etc/hostname
nano /etc/hosts
echo 'deb [arch=arm64] https://mirrors.apqa.cn/proxmox/debian/pve bookworm port'>/etc/apt/sources.list.d/pveport.list
curl https://mirrors.apqa.cn/proxmox/debian/pveport.gpg -o /etc/apt/trusted.gpg.d/pveport.gpg 
apt update && apt full-upgrade
apt install ifupdown2
apt install proxmox-ve postfix open-iscsi
reboot
apt update && apt full-upgrade
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-pve-install.sh)"
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/kernel-clean.sh)"
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/scaling-governor.sh)"
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/cron-update-lxcs.sh)"
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/netdata.sh)"