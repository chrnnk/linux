# linux
Collection of scripts for Linux. Listed below are commands I frequently use but often forget the exact syntax for.

#### Add ssh keys
```sh
sudo nano ~/.ssh/authorized_keys
```

#### Tar.gz
```sh
tar -czvf archive.tar.gz /usr/folder/name
```
```
tar -xf archive.tar.gz -C /usr/folder/name
```

#### Service
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
```
cp -avr /folder/*.iso /folder/iso/
```
```
rsync -avp --stats /folder/iso/ /folder/iso/ --progress
```

#### Show subfolder disk usage for current folder, sorted by largest at top
```sh
du * -sh | sort -hr
```

#### Update everything
```sh
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
```
```
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
