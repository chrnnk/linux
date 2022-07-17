#! bash -c "$(wget -qLO - https://github.com/chrxnn/linux/raw/main/ubuntu-server/map-nas.sh)"
cd /mnt/
sudo mkdir nas
sudo apt install nfs-common -y
sudo su -c "echo 'nas:/mnt/pool1/media /mnt/nas nfs default 0 0' >> /etc/fstab"
sudo mount -a
