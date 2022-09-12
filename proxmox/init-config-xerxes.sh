#!
# from https://github.com/tteck/Proxmox, 1st is his clean-up/repo/subnag fixes
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-install.sh)"
# dark mode
bash <(curl -s https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.sh ) install
# https://pve.proxmox.com/wiki/Pci_passthrough
nano /etc/kernel/cmdline
root=ZFS=rpool/ROOT/pve-1 boot=zfs quiet intel_iommu=on iommu=pt pcie_acs_override=downstream video=efifb:off multifunction #modprobe.blacklist=snd_hda_intel,snd_hda_codec_hdmi,i915
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
echo "blacklist i915" >> /etc/modprobe.d/pve-blacklist.conf 
# Reboot, then verify IOMMU by running the following. There should be a line that looks like "DMAR: Intel(R) Virtualization Technology for Directed I/O"
dmesg | grep -e DMAR -e IOMMU
# To identify if your system has support for IOMMU interrupt remapping, run the following. If you see the following line: "DMAR-IR: Enabled IRQ remapping in x2apic mode" then remapping is supported.
dmesg | grep 'remapping'
# Check the "PCI-E" checkbox in the GUI when adding your device, or manually add the pcie=1 parameter to your VM config:
cat /etc/pve/qemu-server/#IDNUMBER#.conf 
balloon: 0
bios: ovmf
boot: order=virtio0
cores: 6
efidisk0: pvezfs:567/vm-567-disk-0.qcow2,efitype=4m,pre-enrolled-keys=1,size=528K
hostpci0: 0000:00:02,pcie=1
machine: q35
memory: 4096
meta: creation-qemu=7.0.0,ctime=1663017870
name: plex-vm-intel
net0: virtio=92:34:29:2F:10:7F,bridge=vmbr0,firewall=1
numa: 0
ostype: l26
scsihw: virtio-scsi-pci
smbios1: uuid=902d50a3-795a-4412-bff5-a67f8b15da40
sockets: 1
usb0: host=046d:c52b,usb3=1
virtio0: pvezfs:567/vm-567-disk-1.raw,cache=writethrough,discard=on,size=50G
vmgenid: 56f91f86-f9ef-4ea8-b760-90e025c5443d
machine: q35
hostpci0: 01:00.0,pcie=1