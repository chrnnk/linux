#! bash -c "$(wget -qLO - https://github.com/chrxnn/linux/raw/main/ubuntu-server/docker-install.sh)"
## SETUP USERS
# https://github.com/chrxnn/linux/blob/main/ubuntu-server/users-setup.sh
## UPDATE ALL, REBOOT IF NEEDED
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove
## DOCKER SETUP
sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release -y
# get the GPG key which is needed to connect to the Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# add docker repo to APT sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
# install docker-ce, the full fat docker from the docker repo, not the basic docker.io included in debian repos
sudo apt install docker-ce -y
# check that docker is running
# sudo systemctl status docker
# verify this command works
sudo docker ps -a
sudo docker run hello-world
# Download latest docker-compose for your platform
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# made docker-compose executable
sudo chmod +x /usr/local/bin/docker-compose
# check that docker-compose is running
docker-compose -v
# add user to docker group
sudo usermod -aG docker ${USER}
sudo reboot
# AFTER REBOOT CHECK FOLLOWING:
# DOCKER AUTOSTART AFTER REBOOT
# sudo systemctl status docker
# Test running docker commands without sudo
# docker ps -a
