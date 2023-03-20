https://www.veeam.com/kb3155
When you complete Instant VM Recovery from the Veeam Agent backup, then try to edit the VM configuration via ESXi, the following error occurs:
"Enter a disk size which is larger than its original capacity."

Then you try to edit the decimal virtual disk size via ESXi, and another error occurs:
"Failed to reconfigure virtual machine %VM_name%. Invalid operation for device '%device_number.'"

Instant recovery of physical servers does not round up the size of the disk by design. That is why Veeam Backup & Replication might create virtual disks with decimal sizes. If you perform Quick Migration after the recovery, the disks will remain decimal. Due to the VMware bug, ESXi cannot edit the VM configuration with the decimal disk size.

If you do not have vCenter, you need to extend each decimal virtual disk size manually via vmkfstools:

Connect to ESXi that hosts the VM, then go to the VM directory: cd/vmfs/volumes/%datastore_name%/%VM_name%/.

Keep in mind the name of the VMDK file which size you want to increase. Please, ensure that you run the command below on the VMDK file and NOT on the FLAT-VMDK file or the SESPARSE file.Run the following command: 

```
vmkfstools -X NGB %VM_name%.vmdk
```
where "N" is the rounded-up value (for example, if the virtual disk size is shown as 59,5123213218GB, then enter 60GB).

Remove the VM from the inventory, and re-register it.
