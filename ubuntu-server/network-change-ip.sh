sudo nano /etc/netplan/00-installer-config.yaml
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
  sudo netplan apply
