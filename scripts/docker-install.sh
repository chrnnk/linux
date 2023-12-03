#!
# wget -O - https://raw.githubusercontent.com/chrnnk/linux/main/scripts/docker-install.sh | bash

## UPDATE ALL, REBOOT IF NEEDED
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y

## DOCKER SETUP
sudo apt install ca-certificates curl gnupg lsb-release -y

# get the GPG key which is needed to connect to the Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# add docker repo to APT sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y

# install docker-ce, the full fat docker from the docker repo, not the basic docker.io included in debian repos
sudo apt install docker-ce -y

# check that docker is running
# sudo systemctl status docker
# verify this command works
sudo docker ps -a
sudo docker run hello-world

# add user to docker group
sudo usermod -aG docker ${USER}
sudo reboot

# AFTER REBOOT CHECK FOLLOWING:
# DOCKER AUTOSTART AFTER REBOOT
# sudo systemctl status docker
# Test running docker commands without sudo
# docker ps -a