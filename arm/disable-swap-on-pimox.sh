sudo swapoff -a
sudo systemctl stop dphys-swapfile
sudo dphys-swapfile uninstall
sudo systemctl mask dphys-swapfile
