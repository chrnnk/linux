# Useful Linux commands
Collection of commands/scripts for Linux. Listed below are commands I frequently use but often forget the exact syntax for:

## Link to Docker
https://github.com/chrxnn/docker

### Misc commands - uptime, load average, io load, etc
```sh
uptime
ps auxf
ping -c 10
less -R
date='date "+%Y-%m-%d %A %T %Z"'
```
### CPU Usage
```sh
cat /prox/loadavg
htop
ps aux | grep
ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
```
### Show subfolder disk usage for current folder
```sh
du * -sh | sort -hr
du -shc docker/appdata/* | sort -hr | head -25
```
### Check power on hours for all drives
```sh
for drive in $(ls -la /dev | grep -Ev 'sda|sd[a-z][0-9]' | grep sd[a-z] | awk '{print $10}'); do hours=$(smartctl --all /dev/${drive} | grep Power_On_Hours | awk '{print $10}'); echo "Power on Hours for ${drive}: ${hours}"; echo ''; done
```
### Find file and grep
Search files in the current folder
```sh
find . | grep
```
Colorize grep results
```sh
cat file.ext | grep --color TextToSearch
```
### Copy files examples
```sh
rsync -avP /mnt/serenity/folder/ /mnt/nas-media/folder/ --bwlimit=20000
cp -avr /folder/*.iso /folder/iso/
rsync -avP /folder/iso/ /folder/iso/ --stats --progress
```
Copy file from website
```sh
sudo curl -L https://raw.githubusercontent.com/chrxnn/docker/main/ubuntu-setup/create-folders.sh -o ~/scripts/create-folders.sh
```
### Grub commands
```sh
/etc/default/grub
sudo cp /etc/default/grub /etc/default/grub.bak
sudo nano /etc/default/grub
sudo update-grub
```
### Add ssh keys
```sh
sudo nano ~/.ssh/authorized_keys
```
### Neofetch config
```sh
nano ~/.config/neofetch/config.conf
```
### Tar.gz and untar
```sh
tar -czvf archive.tar.gz /usr/folder/name
tar -xf archive.tar.gz -C /usr/folder/name
mktar = 'tar -cvf'
mkbz2 = 'tar -cvjf'
mkgz = 'tar -cvzf'
untar = 'tar -xvf'
unbz2 = 'tar -xvjf'
ungz = 'tar -xvzf'
```
### Services
```sh
sudo systemctl status plexmediaserver
```
### Bash
Run script from website
```sh
wget -O - https://raw.githubusercontent.com/chrxnn/docker/main/ubuntu-setup/create-folders.sh | bash
```
Type clipboard as keystrokes
```sh
sleep 3; xdotool type "$(xclip -o -selection clipboard)"
```
### Updates
Update all with sudo apt
```sh
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
```
Update all with sudo nala
```sh
sudo nala update && sudo nala upgrade -y && sudo nala clean && sudo nala autoremove && sudo nala autopurge
```
Update all without sudo nala
```sh
nala update && nala upgrade -y && nala clean && nala autoremove && nala autopurge
```
In most cases this will give the kept-back packages what they need to successfully upgrade:
```sh
sudo apt install <list of packages kept back>
```
Force install kept-back packages
```sh
sudo apt --with-new-pkgs upgrade
```
## Logging
```sh
tail -f /var/log/syslog
sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f
```
## Networking
Restart all network adapters
```sh
ifdown -a && ifup -a
```
Show current network connections to the server
```sh
netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'
```
Show open ports
```sh
netstat -nape --inet
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
