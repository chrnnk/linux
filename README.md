# Useful Linux commands
Collection of commands/scripts for Linux. Listed below are commands I frequently use but often forget the exact syntax for.

#### Link to Docker
https://github.com/chrxnn/docker

#### Misc commands - uptime, load average, io load, etc
```sh
uptime
cat /prox/loadavg
htop
iotop
```

#### Cat and grep
Show line numbers
```sh
cat -n file.ext
```
Colorize grep results
```sh
cat file.ext | grep --color TextToSearch
```

#### Add ssh keys
```sh
sudo nano ~/.ssh/authorized_keys
```

#### Neofetch config
```sh
nano ~/.config/neofetch/config.conf
```

#### Tar.gz and untar
```sh
tar -czvf archive.tar.gz /usr/folder/name
```
```sh
tar -xf archive.tar.gz -C /usr/folder/name
```

#### Services
```sh
sudo systemctl status plexmediaserver
```

#### Run script from github
```sh
wget -O - https://raw.githubusercontent.com/chrxnn/docker/main/ubuntu-setup/create-folders.sh | bash
```

#### Copy file from website
```sh
sudo curl -L https://raw.githubusercontent.com/chrxnn/docker/main/ubuntu-setup/create-folders.sh -o ~/scripts/create-folders.sh
```

#### Copy files examples
```sh
cp -avr /folder/*.iso /folder/iso/
```
```sh
rsync -avP /folder/iso/ /folder/iso/ --stats
```

#### Show subfolder disk usage for current folder, sorted by largest at top
```sh
du * -sh | sort -hr
```

#### Update everything
```sh
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
```
```sh
apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y
```

#### Tail a log
```sh
tail -f /var/log/syslog
```

#### Restart networking with ifupdown
```sh
ifdown -a && ifup -a
```

#### Ubuntu server networking
```sh
cd /etc/netplan/
nano filename.yaml
netplan try
netplan apply
```
