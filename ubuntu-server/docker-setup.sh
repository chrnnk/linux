#! wget -O - https://raw.githubusercontent.com/chrxnn/linux/main/ubuntu-server/docker-setup.sh | bash
sudo apt install acl
sudo chmod 775 /home/$USER/docker
sudo setfacl -Rdm g:docker:rwx /home/$USER/docker
sudo setfacl -Rm g:docker:rwx /home/$USER/docker
# 
sudo chown root:root /home/$USER/docker/.env
sudo chmod 600 /home/$USER/docker/.env
# set up .env
sudo nano /home/$USER/docker/.env
# https://github.com/chrxnn/docker/blob/main/docker.env
# save file with ctrl+o, enter, then ctrl+x to exit
