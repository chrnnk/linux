#!
# wget -O - https://raw.githubusercontent.com/chrnnk/linux/main/docker-install/docker-install.sh | bash
## UPDATE EVERYTHING
printf '\nUpdating everything\n\n'
sleep 5
apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y
printf '\nEverything successfully updated\n\n'
sleep 5
## PREREQ INSTALL
printf '\nInstalling Prerequisites\n\n'
sleep 5
apt install curl -y
printf '\nPrerequisites installed successfully\n\n'
sleep 5
## DOCKER INSTALL
printf '\nInstalling Docker\n\n'
sleep 5
curl -fsSL https://get.docker.com -o get-docker.sh
wget -O - https://raw.githubusercontent.com/chrnnk/linux/main/scripts/docker-install.sh | bash
printf '\nDocker installed successfully\n\n'
sleep 5
## DOCKER COMPOSE INSTALL
printf '\nInstalling Docker Compose\n\n'
sleep 5
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
printf '\nDocker Compose installed successfully\n\n'
sleep 5
# check that docker is running and working
printf '\nCheck that Ddocker and Docker Compose are running and working\n\n'
sleep 5
docker ps -a
docker run hello-world
docker-compose -v
sleep 5