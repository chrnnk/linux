### Optimal Windows VM settings
https://pve.proxmox.com/wiki/Performance_Tweaks#Windows

## System

Use QEMU Agent on System tab in VM Creation, after installing guest agent from virtIO-drivers.iso
SCSI Controller on VirtIO SCSI. Linux has built in drivers, Windows need virtIO-drivers.iso

## Hard Disk

Set Disk Bus to SCSI
Use virtIO for disk and network for best performance. Linux has built in drivers, Windows need virtIO ISO
Set "Write back" as cache option for best performance (the "No cache" default is safer, but slower)
Check Discard if VM is running on an SSD for TRIM support
Use raw disk image and not qcow2 for a partition, especially with Microsoft SQL database files because qcow2 can be very slow under such type of load. 

## Memory

DO NOT use memory ballooning on Windows VMs (The Balloon driver has been a source of performance problems on Windows, you should avoid it. (see http://forum.proxmox.com/threads/20265-SOLVED-Hyper-Threading-vs-No-Hyper-Threading-Fixed-vs-Variable-Memory for the discussion thread) )
