#! bash -c "$(wget -qLO - https://github.com/chrxnn/linux/raw/main/ubuntu-server/docker-setup.sh)"
sudo apt install acl
sudo chmod 775 /home/$USER/docker
sudo setfacl -Rdm g:docker:rwx /home/$USER/docker
sudo setfacl -Rm g:docker:rwx /home/$USER/docker
# 
sudo chown root:root /home/$USER/docker/.env
sudo chmod 600 /home/$USER/docker/.env
# sudo nano /home/$USER/docker/.env
