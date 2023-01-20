#!
# bash -c "$(wget -qLO - https://github.com/chrxnn/linux/raw/main/ubuntu-server/map-nas.sh)"
cd /mnt/
sudo mkdir data downloads media
sudo apt install nfs-common -y
sudo su -c "echo 'unraid.chrxnn.lan:/mnt/user/media/ /mnt/media nfs default 0 0' >> /etc/fstab"
sudo su -c "echo 'unraid.chrxnn.lan:/mnt/user/downloads/ /mnt/downloads nfs default 0 0' >> /etc/fstab"
sudo mount -a