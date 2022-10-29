# Useful Linux commands
Collection of commands/scripts for Linux. Listed below are commands I frequently use but often forget the exact syntax for.

## Link to Docker
https://github.com/chrxnn/docker

## Misc commands - uptime, load average, io load, etc
```sh
uptime

ps auxf
ping -c 10
less -R
date='date "+%Y-%m-%d %A %T %Z"'
```
## CPU Usage
```sh
cat /prox/loadavg
htop

ps aux | grep
ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
```

## Storage Usage
iotop
### Show subfolder disk usage for current folder, sorted by largest at top
```sh
du * -sh | sort -hr
```

## Find file and grep
### Search files in the current folder
find . | grep
### Colorize grep results
```sh
cat file.ext | grep --color TextToSearch
```

## Add ssh keys
```sh
sudo nano ~/.ssh/authorized_keys
```

## Neofetch config
```sh
nano ~/.config/neofetch/config.conf
```

## Tar.gz and untar
```sh
tar -czvf archive.tar.gz /usr/folder/name
```
```sh
tar -xf archive.tar.gz -C /usr/folder/name
```

## Services
```sh
sudo systemctl status plexmediaserver
```

## Run script from github
```sh
wget -O - https://raw.githubusercontent.com/chrxnn/docker/main/ubuntu-setup/create-folders.sh | bash
```

## Copy file from website
```sh
sudo curl -L https://raw.githubusercontent.com/chrxnn/docker/main/ubuntu-setup/create-folders.sh -o ~/scripts/create-folders.sh
```

## Copy files examples
```sh
cp -i
mv -i
rm -iv
mkdir -p
cp -avr /folder/*.iso /folder/iso/
rsync -avP /folder/iso/ /folder/iso/ --stats
```


## Updates
Update all with sudo
```sh
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
```
Update all without sudo
```sh
apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y
```
Update all with sudo and nala alias
```sh
sudo apt update && sudo apt upgrade -y && sudo \apt dist-upgrade -y && sudo apt autoremove -y
```
In most cases this will give the kept-back packages what they need to successfully upgrade:
```sh
sudo apt-get install <list of packages kept back>
```
Force install kept-back packages
```sh
sudo apt-get --with-new-pkgs upgrade
```

## Logging
```sh
tail -f /var/log/syslog
```

## Restart networking with ifupdown
```sh
ifdown -a && ifup -a
```

## Ubuntu server networking
```
cd /etc/netplan
ls
sudo nano FILENAME.yaml
# fix networking
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
# save file
sudo netplan try
sudo netplan apply
```
