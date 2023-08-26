#!
# below code will turn off laptop screen after 20 seconds of inactivity
# GRUB
nano /etc/default/grub
GRUB_CMDLINE_LINUX = 'consoleblank=20'
update-grub
# below code will disable sleep on lid close
nano /etc/systemd/logind.conf
HandleLidSwitch=ignore
HandleLidSwitchDocked=ignore
# ctrl+s to save file, then run
systemctl restart systemd-logind
reboot
# go here https://github.com/chrxnn/linux/blob/main/proxmox/screen-sleep.sh
# SYSTEMD-BOOT
nano /etc/kernel/cmdline
# add consoleblank=20 to end
proxmox-boot-tool refresh
reboot
