#!
# From https://github.com/tteck/Proxmox, 1st is his clean-up/repo/subnag fixes
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-pve-install.sh)"
# Dark mode
bash <(curl -s https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.sh ) install
# Install sensors
apt install -y git build-essential dkms pve-headers mdevctl lm-sensors htop
# PCI passthrough https://pve.proxmox.com/wiki/Pci_passthrough
nano /etc/default/grub
# Find the line with "GRUB_CMDLINE_LINUX_DEFAULT" and add
intel_iommu=on iommu=pt
# Save changes to the file
update-grub
# Add the modules to /etc/modules
echo -e "vfio\nvfio_iommu_type1\nvfio_pci\nvfio_virqfd" >> /etc/modules
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
update-initramfs -u -k all
reboot
# Reboot, then verify by running:
dmesg | grep -e DMAR -e IOMMU
# There should be a line that looks like "DMAR: IOMMU enabled"
# To identify if your system has support for IOMMU interrupt remapping:
dmesg | grep 'remapping'
# If you see the following line: "DMAR-IR: Enabled IRQ remapping in x2apic mode" then remapping is supported. 
# Check the "PCI-E" checkbox in the GUI when adding your device, or manually add the pcie=1 parameter to your VM config. Only q35 supports PCI-E.
# machine: q35
# hostpci0: 01:00.0,pcie=1
sysctl vm.swappiness=0


git clone https://gitlab.com/polloloco/vgpu-proxmox.git
cd /opt
git clone https://github.com/mbilker/vgpu_unlock-rs.git
curl https://sh.rustup.rs -sSf | sh -s -- -y --profile minimal
source $HOME/.cargo/env
cd vgpu_unlock-rs/
cargo build --release
mkdir /etc/vgpu_unlock
touch /etc/vgpu_unlock/profile_override.toml
mkdir /etc/systemd/system/{nvidia-vgpud.service.d,nvidia-vgpu-mgr.service.d}
echo -e "[Service]\nEnvironment=LD_PRELOAD=/opt/vgpu_unlock-rs/target/release/libvgpu_unlock_rs.so" > /etc/systemd/system/nvidia-vgpud.service.d/vgpu_unlock.conf
echo -e "[Service]\nEnvironment=LD_PRELOAD=/opt/vgpu_unlock-rs/target/release/libvgpu_unlock_rs.so" > /etc/systemd/system/nvidia-vgpu-mgr.service.d/vgpu_unlock.conf