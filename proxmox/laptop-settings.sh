#!
# below code will turn off laptop screen after 20 seconds of inactivity
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
