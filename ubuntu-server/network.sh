#!
apt-get install network-tools
ifconfig | grep mtu
ifconfig interface_name mtu 9000 up
# test, then to make permanent
sudo nano /etc/network/interfaces
# append the below line in the file:
post-up /sbin/ifconfig ens33 mtu 9000 up
# save, close
sudo service networking restart
sudo ifup interface_name
