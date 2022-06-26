#!
apt-get install network-tools
ifconfig | grep mtu
ifconfig Interface_name> mtu mtu_size> up
# test, then to make permanent
sudo nano /etc/network/interfaces
# append the below line in the file:
post-up /sbin/ifconfig ens33 mtu 1300 up
# save, close
sudo service networking restart
sudo ifup interface_name
