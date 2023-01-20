#!
# wget -O - https://raw.githubusercontent.com/chrxnn/linux/main/scripts/5-docker-create-folders.sh | bash

cd ~
mkdir docker
cd docker
mkdir appdata logs scripts secrets shared compose
touch ~/docker/.env