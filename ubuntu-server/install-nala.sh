sudo apt update && sudo apt install nala -y
sudo nala fetch
# edit both files below and add the following lines
sudo nano ~/.bashrc
sudo nano /root/.bashrc
# add the below
# convert apt to nala
apt() { 
  command nala "$@"
}
sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}
# save and exit
