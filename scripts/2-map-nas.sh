#!
# wget -O - https://raw.githubusercontent.com/chrxnn/linux/main/scripts/2-map-nas.sh | bash

cd /mnt/
sudo mkdir media
sudo apt install nfs-common -y
sudo su -c "echo 'unraid.chrxnn.lan:/mnt/user/media/ /mnt/media nfs default 0 0' >> /etc/fstab"
sudo mount -a
