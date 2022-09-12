#!
# from https://github.com/tteck/Proxmox, 1st is his clean-up/repo/subnag fixes
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-install-v3.sh)"
# dark mode
bash <(curl -s https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.sh ) install
# https://pve.proxmox.com/wiki/Pci_passthrough
nano /etc/default/grub
# Find the line with "GRUB_CMDLINE_LINUX_DEFAULT", For Intel CPUs add
intel_iommu=on
# Working now with 7700k iGPU in VM
GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on iommu=pt pcie_acs_override=downstream,multifunction video=efifb:off modprobe.blacklist=radeon,nouveau,nvidia,nvidiafb,nvidia-gpu,snd_hda_intel,snd_hda_codec_hdmi,i915"
# save changes to the file, then update grub
update-grub
# add the modules to /etc/modules
nano /etc/modules
# Intel IOMMU
vfio
vfio_iommu_type1
vfio_pci
vfio_virqfd
# Save the file
nano /etc/modprobe.d/pve-blacklist.conf
# nidiafb see bugreport https://bugzilla.proxmox.com/show_bug.cgi?id=701
blacklist nvidiafb
# i915
blacklist i915
# save the file. Reboot, then verify by running:
dmesg | grep -e DMAR -e IOMMU
# There should be a line that looks like "DMAR: IOMMU enabled"
# To identify if your system has support for IOMMU interrupt remapping:
dmesg | grep 'remapping'
# If you see the following line: "DMAR-IR: Enabled IRQ remapping in x2apic mode" then remapping is supported. 
# Check the "PCI-E" checkbox in the GUI when adding your device, or manually add the pcie=1 parameter to your VM config:
machine: q35
hostpci0: 01:00.0,pcie=1
# Only q35 supports PCI-E