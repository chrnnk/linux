# linux
collection of scripts for linux

#### Add ssh keys
```sh
cd .ssh/
sudo nano authorized_keys
```

#### Tar.gz
```sh
tar -czvf archive.tar.gz /usr/folder/name
```

#### Plex service
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
