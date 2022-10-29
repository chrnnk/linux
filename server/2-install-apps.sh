sudo apt update && sudo apt install nala -y
cd ~
mkdir github
cd github
git clone https://github.com/chrxnn/linux
sudo nala fetch
# 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
## edit both files below and add the following lines
#sudo nano ~/.bashrc
#sudo nano /root/.bashrc
## add the below
## convert apt to nala
#apt() { 
#  command nala "$@"
#}
#sudo() {
#  if [ "$1" = "apt" ]; then
#    shift
#    command sudo nala "$@"
#  else
#    command sudo "$@"
#  fi
#}
## save and exit
