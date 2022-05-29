# Unraid commands
## Docker service

```sh
/etc/rc.d/rc.docker [command]
```
Available commands: start stop restart status

## Docker containers

### Basic commands

```sh
docker [command] [containername]
```
Available commands: start stop restart pause logs

### Print all container names:

```sh
docker ps --format ‘{{.Names}}’
```
### Print all container images:

```sh
docker ps --format ‘{{.Image}}’
```
## Nginx

```sh
/etc/rc.d/rc.nginx [command]
```
Available commands: start stop restart status

## PHP

```sh
/etc/rc.d/rc.php-fpm [command]
```
Available commands: start stop restart status

## VM Service

### Basic commands

```sh
/etc/rc.d/rc.libvirt [command]
```
Available commands: start stop

## List all domains:

```sh
virsh list --all
```
## Domains

```sh
virsh [command] [domain]
```
Available commands: start shutdown reboot suspend

## Samba

```sh
/etc/rd.d/rc.samba [command]
```
Available commands: start stop

## Unraid

### Shutdown/Reboot

```sh
/sbin/[command]
```
Available commands: reboot poweroff shutdown

Note - If you get an unclean shutdown when running "poweroff" you need to adjust your timeout settings, see https://forums.unraid.net/topic/69868-dealing-with-unclean-shutdowns

### Run diagnostics

```sh
diagnostics
```
### Tail the syslog

```sh
tail -f /var/log/syslog
```
### Look at the parameters in the config file

```sh
nano /boot/syslinux.cfg-
```
### Create a backup image of your usb and store it on disk1

```sh
dd if=/dev/sda of=/mnt/disk1/unraid.img
```
### Check power on hours for all drives

```sh
for drive in $(ls -la /dev | grep -Ev 'sda|sd[a-z][0-9]' | grep sd[a-z] | awk '{print $10}'); do hours=$(smartctl --all /dev/${drive} | grep Power_On_Hours | awk '{print $10}'); echo "Power on Hours for ${drive}: ${hours}"; echo ''; done
```
