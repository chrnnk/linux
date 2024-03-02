swapoff -a
systemctl stop dphys-swapfile
dphys-swapfile uninstall
systemctl mask dphys-swapfile
reboot
