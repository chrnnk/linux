# install acl
sudo apt install acl
sudo chmod 775 /home/$USER/docker
sudo setfacl -Rdm g:docker:rwx /home/$USER/docker
sudo setfacl -Rm g:docker:rwx /home/$USER/docker
# 
sudo chown root:root /home/$USER/docker/.env
sudo chmod 600 /home/$USER/docker/.env
# set up .env
sudo nano /home/$USER/docker/.env
# PUID and PGID - the user ID and group ID of the linux user who we want to run the dockers as. Both of these can be obtained using the id command
PUID=1000
PGID=1000
TZ="America/New_York"
USERDIR="/home/$USER"
DOCKERDIR="/home/$USER/docker"
DATADIR="/mnt/truenas"
# save file with ctrl+o, enter, then ctrl+x to exit