# linux
Collection of scripts for linux. Listed below are commands I frequently use but often forget the exact syntax for.

#### Add ssh keys
```sh
cd .ssh/
sudo nano authorized_keys
```

#### Tar.gz
```sh
tar -czvf archive.tar.gz /usr/folder/name
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
cp -avr /mnt/pve/synology/template/iso/*.iso /mnt/pve/nas-raidz-data/template/iso/
rsync -avp --stats /mnt/pve/synology/template/iso/ /mnt/pve/nas-raidz-data/template/iso/
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

#### Tail the syslog
```sh
tail -f /var/log/syslog
```

#### Restart networking with ifupdown
```sh
ifdown -a && ifup -a
```

#### Look at the parameters in the config file
```sh
nano /boot/syslinux.cfg-
```
