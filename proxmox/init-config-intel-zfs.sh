#!
# from https://github.com/tteck/Proxmox, 1st is his clean-up/repo/subnag fixes
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-install.sh)"
# dark mode
bash <(curl -s https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.sh ) install
# install sensors
apt-get install lm-sensors
# https://pve.proxmox.com/wiki/Pci_passthrough
nano /etc/kernel/cmdline
quiet intel_iommu=on iommu=pt pcie_acs_override=downstream video=efifb:off multifunction
# save changes to the file, then update proxmox-boot-tool
proxmox-boot-tool refresh
# add the modules to /etc/modules
nano /etc/modules
# Intel IOMMU
vfio
vfio_iommu_type1
vfio_pci
vfio_virqfd
# Save the file
# modprobe.blacklist=snd_hda_intel,snd_hda_codec_hdmi,i915
echo "blacklist i915" >> /etc/modprobe.d/pve-blacklist.conf 
# Reboot, then verify IOMMU by running the following. There should be a line that looks like "DMAR: Intel(R) Virtualization Technology for Directed I/O"
dmesg | grep -e DMAR -e IOMMU
# To identify if your system has support for IOMMU interrupt remapping, run the following. If you see the following line: "DMAR-IR: Enabled IRQ remapping in x2apic mode" then remapping is supported.
dmesg | grep 'remapping'
# Check the "PCI-E" checkbox in the GUI when adding your device, or manually add the pcie=1 parameter to your VM config:
cat /etc/pve/qemu-server/#IDNUMBER#.conf 
bios: ovmf
hostpci0: 0000:00:02,pcie=1
machine: q35
