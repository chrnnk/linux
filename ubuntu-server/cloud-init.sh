# Download Ubuntu (replace with the url of the one you chose from above)
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
# Create a new virtual machine
qm create 9560 --memory 4096 --core 4 --name ubuntu-cloud --net0 virtio,bridge=vmbr0
# Import the downloaded Ubuntu disk to storage
qm importdisk 9560 jammy-server-cloudimg-amd64.img xerxes-truenas
# Attach the new disk to the vm as a scsi drive on the scsi controller
qm set 9560 --scsihw virtio-scsi-pci --scsi0 xerxes-truenas:vm-9560-disk-0.raw
# Add cloud init drive
qm set 9560 --ide2 xerxes-truenas:cloudinit
# Make the cloud init drive bootable and restrict BIOS to boot from disk only
qm set 9560 --boot c --bootdisk scsi0
# Add serial console
qm set 9560 --serial0 socket --vga serial0
# DO NOT START YOUR VM
# Create template
qm template 9560
# Clone template
qm clone 9560 135 --name yoshi --full