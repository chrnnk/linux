#!  bash -c "$(wget -qLO - https://github.com/chrxnn/linux/raw/main/ubuntu-server/docker-create-folders.sh)"
cd ~
mkdir docker
cd docker
mkdir appdata logs scripts secrets shared compose
touch ~/docker/.env
# wget -O ~/docker/.env https://raw.githubusercontent.com/chrxnn/docker/main/docker.env
ln -s ~/github/private/docker ~/docker/secrets