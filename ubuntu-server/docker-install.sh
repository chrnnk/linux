## SETUP USERS
# https://github.com/chrxnn/linux/blob/main/ubuntu-server/setup-users.sh
## UPDATE ALL, REBOOT IF NEEDED
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove
## DOCKER SETUP
sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release
# get the GPG key which is needed to connect to the Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# add docker repo to APT sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove
# install docker-ce, the full fat docker from the docker repo, not the basic docker.io included in debian repos
sudo apt install docker-ce
# check that docker is running
sudo systemctl status docker
# verify this command works
sudo docker ps -a
sudo docker run hello-world
# CHANGE LATEST TO CURRENT VERSION NUMBER download latest docker-compose (direct, no repo apparently) CHANGE LATEST to proper version ex "v2.4.1"
sudo curl -L https://github.com/docker/compose/releases/download/vLATEST/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# made docker-compose executable
sudo chmod +x /usr/local/bin/docker-compose
# check that docker-compose is running
docker-compose -v

# create docker group. should have been created already but just in case
cat /etc/group
# if no docker group at bottom of this list, run following
sudo groupadd docker
# add user to docker group
sudo usermod -aG docker ${USER}
# log back out and back in, test running "docker ps" without sudo
docker ps
# make sure docker autostarts after reboot
sudo systemctl status docker
