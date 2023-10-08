#!
# wget -O - https://raw.githubusercontent.com/chrxnn/linux/main/scripts/2-map-nas.sh | bash
sudo mkdir /mnt/media /mnt/tdarr /mnt/backups /mnt/games /mnt/data
sudo su -c "echo 'xerxes-unraid.home.chrnnk.tv:/mnt/user/media/    /mnt/media    nfs default 0 0' >> /etc/fstab"
sudo su -c "echo 'xerxes-unraid.home.chrnnk.tv:/mnt/user/media/    /mnt/media    nfs default 0 0' >> /etc/fstab"
sudo su -c "echo 'xerxes-unraid.home.chrnnk.tv:/mnt/user/tdarr/    /mnt/tdarr    nfs default 0 0' >> /etc/fstab"
sudo su -c "echo 'xerxes-unraid.home.chrnnk.tv:/mnt/user/backups/  /mnt/backups  nfs default 0 0' >> /etc/fstab"
sudo su -c "echo 'xerxes-unraid.home.chrnnk.tv:/mnt/user/games/    /mnt/games    nfs default 0 0' >> /etc/fstab"
sudo su -c "echo 'xerxes-unraid.home.chrnnk.tv:/mnt/user/data/     /mnt/media    nfs data 0 0' >> /etc/fstab"
sudo mount -a
