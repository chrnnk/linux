#!
cd /etc/netplan
ls
sudo nano FILENAME.yaml
# fix networking
```
network:
  ethernets:
    ens18:
      dhcp4: false
      addresses:
        -  IPADDRESS/24
      gateway4: GATEWAY
      nameservers:
        addresses: [1.1.1.1,8.8.8.8]
  version: 2
  ```
sudo netplan try
sudo netplan apply

