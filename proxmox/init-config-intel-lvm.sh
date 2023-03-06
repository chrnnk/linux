#!
# From https://github.com/tteck/Proxmox, 1st is his clean-up/repo/subnag fixes
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-install-v3.sh)"
# Dark mode
bash <(curl -s https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.sh ) install
# Install sensors
apt install lm-sensors htop -y
# PCI passthrough https://pve.proxmox.com/wiki/Pci_passthrough
nano /etc/default/grub
# Find the line with "GRUB_CMDLINE_LINUX_DEFAULT" and add
intel_iommu=on
# Save changes to the file
update-grub
# Add the modules to /etc/modules
nano /etc/modules
# IOMMU
vfio
vfio_iommu_type1
vfio_pci
vfio_virqfd
# Save the file
update-initramfs -u -k all
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
