# setup below is for debian 10 on arm CuBox IMX6
sudo passwd root
sudo nano /etc/ssh/sshd_config
# find the key #PermitRootLogin
# change that line to 
PermitRootLogin yes
# save and exit nano
sudo systemctl restart sshd
sudo apt update && sudo apt upgrade -y
sudo apt install corosync-qnetd corosync-qdevice
hostnamectl set-hostname HOST-PVE
# on full proxmox servers, run this: "apt install corosync-qdevice"
# on one of the full proxmox servers, run this with the new qdevice's IP: "pvecm qdevice setup IPHERE -f"