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



