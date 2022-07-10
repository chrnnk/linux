#!
# from https://github.com/tteck/Proxmox, 1st is his clean-up/repo/subnag fixes
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-install-v3.sh)"
# dark mode
bash <(curl -s https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.sh ) install
# PCI passthrough
# https://pve.proxmox.com/wiki/Pci_passthrough
nano /etc/default/grub
# For Intel CPUs add
intel_iommu=on
# For AMD CPUs add
amd_iommu=on
# save changes to the file
update-grub
# add the modules to /etc/modules
nano /etc/modules
# add these
vfio
vfio_iommu_type1
vfio_pci
vfio_virqfd
# save the file
# Reboot, then verify by running:
dmesg | grep -e DMAR -e IOMMU
# There should be a line that looks like "DMAR: IOMMU enabled"
# To identify if your system has support for IOMMU interrupt remapping:
dmesg | grep 'remapping'
# If you see one of the following lines: "AMD-Vi: Interrupt remapping enabled" or "DMAR-IR: Enabled IRQ remapping in x2apic mode" then remapping is supported. 
# Check the "PCI-E" checkbox in the GUI when adding your device, or manually add the pcie=1 parameter to your VM config:
machine: q35
hostpci0: 01:00.0,pcie=1
# Only q35 supports PCI-E





# update all lxc's
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/update-lxcs.sh)"
# Find the line with "GRUB_CMDLINE_LINUX_DEFAULT" 
