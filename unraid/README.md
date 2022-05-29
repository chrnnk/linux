Nice to know Unraid commands¶
Docker service¶

/etc/rc.d/rc.docker <command>

Available commands: start stop restart status
Docker containers¶

docker <command> <containername>

Available commands: start stop restart pause logs

Print all container names:

docker ps --format ‘{{.Names}}’

Print all container images:

docker ps --format ‘{{.Image}}’

Nginx¶

/etc/rc.d/rc.nginx <command>

Available commands: start stop restart status
PHP¶

/etc/rc.d/rc.php-fpm <command>

Available commands: start stop restart status
VM Service¶

/etc/rc.d/rc.libvirt <command>

Available commands: start stop

List all domains:

virsh list --all

Domains¶

virsh <command> <domain>

Available commands: start shutdown reboot suspend
Samba¶

/etc/rd.d/rc.samba <command>

Available commands: start stop
Unraid¶
Shutdown/Reboot¶

/sbin/<command>

Available commands: reboot poweroff shutdown

Note

poweroff If you get an unclean shutdown when issuing this command you need to adjust your timeout settings, see https://forums.unraid.net/topic/69868-dealing-with-unclean-shutdowns
Run diagnostics¶

diagnostics

Tail the syslog¶

tail -f /var/log/syslog

Look at the parameters in the config file¶

nano /boot/syslinux.cfg-

Create a backup image of your usb and store it on disk1¶

dd if=/dev/sda of=/mnt/disk1/unraid.img

Copy files using midnight commander¶

mc

Check power on hours for all drives¶

for drive in $(ls -la /dev | grep -Ev 'sda|sd[a-z][0-9]' | grep sd[a-z] | awk '{print $10}'); do hours=$(smartctl --all /dev/${drive} | grep Power_On_Hours | awk '{print $10}'); echo "Power on Hours for ${drive}: ${hours}"; echo ''; done

