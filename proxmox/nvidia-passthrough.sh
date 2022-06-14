# in the shell of the node
# check to see what kernel version you are running
uname -r
# install headers
apt-cache search pve-header
apt install pve-headers-$(uname -r)
# blacklist nouveau
nano /etc/modprobe.d/blacklist.conf
blacklist nouveau
# save, close
update-initramfs -u
# reboot
# install dependencies
apt install build-essential
# download drivers
cd ~
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/515.48.07/NVIDIA-Linux-x86_64-515.48.07.run
# make driver file executable
chmod +x NVIDIA-Linux-x86_64-515.48.07.run
# install the drivers, don't worry about updating X
./NVIDIA-Linux-x86_64-515.48.07.run --check
./NVIDIA-Linux-x86_64-515.48.07.run
# make sure drivers load when restarted
echo -e '\n# load nvidia modules\nnvidia-drm\nnvidia-uvm' >> /etc/modules-load.d/modules.conf
# create udev rules
nano /etc/udev/rules.d/70-nvidia.rules
# add lines
KERNEL=="nvidia", RUN+="/bin/bash -c '/usr/bin/nvidia-smi -L && /bin/chmod 666 /dev/nvidia*'"
#KERNEL=="nvidia_modeset", RUN+="/bin/bash -c '/usr/bin/nvidia-modprobe -c0 -m && /bin/chmod 666 /dev/nvidia-modeset*'"
KERNEL=="nvidia_uvm", RUN+="/bin/bash -c '/usr/bin/nvidia-modprobe -c0 -u && /bin/chmod 666 /dev/nvidia-uvm*'"
SUBSYSTEM=="module", ACTION=="add", DEVPATH=="/module/nvidia", RUN+="/usr/bin/nvidia-modprobe -m"
# save, close
# copy and extract persistence service, keeps driver/kernel module loaded when the GPU is unused
cp /usr/share/doc/NVIDIA_GLX-1.0/samples/nvidia-persistenced-init.tar.bz2 .
bunzip2 nvidia-persistenced-init.tar.bz2
tar -xf nvidia-persistenced-init.tar
# remove old, if any (to avoid masked service)
rm /etc/systemd/system/nvidia-persistenced.service
# install
chmod +x nvidia-persistenced-init/install.sh
./nvidia-persistenced-init/install.sh
# check that it's ok
systemctl status nvidia-persistenced.service
rm -rf nvidia-persistenced-init*
update-initramfs -u
# reboot
# check that the drivers are running
nvidia-smi
# edit the conf container you want to passthrough too
nano /etc/pve/lxc/(YOURCONTAINERID).conf
# add these lines but make sure the path (numbers) are correct
ls -l /dev/nv*
# allow cgroup access
lxc.cgroup2.devices.allow = c 195:0 rw
lxc.cgroup2.devices.allow = c 195:255 rw
lxc.cgroup2.devices.allow = c 195:254 rw
lxc.cgroup2.devices.allow = c 510:0 rw
lxc.cgroup2.devices.allow = c 510:1 rw
lxc.cgroup2.devices.allow = c 10:144 rw
# pass through device files
lxc.mount.entry = /dev/nvidia0 dev/nvidia0 none bind,optional,create=file
lxc.mount.entry = /dev/nvidiactl dev/nvidiactl none bind,optional,create=file
lxc.mount.entry = /dev/nvidia-modeset dev/nvidia-modeset none bind,optional,create=file
lxc.mount.entry = /dev/nvidia-uvm dev/nvidia-uvm none bind,optional,create=file
lxc.mount.entry = /dev/nvidia-uvm-tools dev/nvidia-uvm-tools none bind,optional,create=file
lxc.mount.entry = /dev/nvram dev/nvram none bind,optional,create=file
# start the container
apt update && apt upgrade -y
# download drivers in the container this time
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/515.48.07/NVIDIA-Linux-x86_64-515.48.07.run 
# Nvidia driver site: https://www.nvidia.com/Download/index...
# make driver file executable
chmod +x NVIDIA-Linux-x86_64-515.48.07.run
# run the drivers file with the extension
./NVIDIA-Linux-x86_64-515.48.07.run --no-kernel-module
# reboot
nvidia-smi
# install Plex
wget https://downloads.plex.tv/plex-media-...
dpkg -i plexmediaserver*.deb
systemctl enable plexmediaserver.service
systemctl start plexmediaserver.service
# access Plex