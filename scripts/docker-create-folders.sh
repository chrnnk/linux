#!
# wget -O - https://raw.githubusercontent.com/chrxnn/linux/main/scripts/5-docker-create-folders.sh | bash

mkdir ~/github
mkdir ~/docker
cd ~/docker
mkdir appdata logs scripts secrets shared compose
touch ~/docker/.env
cd ~/github
git clone https://github.com/housefisharr/app-icons
ln -s ~/github/app-icons ~/docker/app-icons
