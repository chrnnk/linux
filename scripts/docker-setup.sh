#!
# wget -O - https://raw.githubusercontent.com/chrxnn/linux/main/scripts/6-docker-setup.sh | bash

sudo apt install acl -y
sudo chmod 775 /home/$USER/docker
sudo setfacl -Rdm g:docker:rwx /home/$USER/docker
sudo setfacl -Rm g:docker:rwx /home/$USER/docker
# 
sudo chown root:root /home/$USER/docker/.env
sudo chmod 600 /home/$USER/docker/.env
# sudo nano /home/$USER/docker/.env
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
docker network create custom-bridge
