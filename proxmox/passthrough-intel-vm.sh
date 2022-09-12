# in the shell of the node
nano /etc/default/grub
# look for the line "GRUB_CMDLINE_LINUX_DEFAULT="quiet""
GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on"
# save and exit
update-grub
echo "options vfio_iommu_type1 allow_unsafe_interrupts=1" > /etc/modprobe.d/iommu_unsafe_interrupts.conf
echo "options kvm ignore_msrs=1" > /etc/modprobe.d/kvm.conf
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
echo "blacklist nvidia" >> /etc/modprobe.d/blacklist.conf
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
wget https://us.download.nvidia.com/XFree86/Linux-x86_64/515.65.01/NVIDIA-Linux-x86_64-515.65.01.run
# make driver file executable
chmod +x NVIDIA-Linux-x86_64-515.65.01.run
# install the drivers, don't worry about updating X
./NVIDIA-Linux-x86_64-515.65.01.run --check
./NVIDIA-Linux-x86_64-515.65.01.run
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
