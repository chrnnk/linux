#!
sudo useradd -D -s /bin/bash
sudo useradd -m nick
sudo passwd nick
sudo nano /etc/cloud/cloud.cfg
sudo reboot
sudo hostnamectl set-hostname potato
