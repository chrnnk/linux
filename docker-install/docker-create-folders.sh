#!
# wget -O - https://raw.githubusercontent.com/chrnnk/linux/main/scripts/docker-create-folders.sh | bash

mkdir ~/github
mkdir ~/docker
cd ~/docker
mkdir appdata logs scripts secrets shared compose
touch ~/docker/.env
cd ~/github
git clone https://github.com/housefisharr/app-icons
ln -s ~/github/app-icons ~/docker/app-icons
