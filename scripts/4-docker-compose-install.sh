#!
# wget -O - https://raw.githubusercontent.com/chrxnn/linux/main/scripts/4-docker-compose-install.sh | bash

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