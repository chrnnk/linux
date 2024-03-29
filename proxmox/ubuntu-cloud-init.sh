# Download Ubuntu (replace with the url of the one you chose from above)
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
# Create a new virtual machine
qm create 9560 --memory 4096 --core 4 --name docker-ubuntu --net0 virtio,bridge=vmbr0
# Import the downloaded Ubuntu disk to storage
qm importdisk 9560 jammy-server-cloudimg-amd64.img xerxes-truenas
# Attach the new disk to the vm as a scsi drive on the scsi controller
qm set 9560 --scsihw virtio-scsi-pci --scsi0 xerxes-truenas:9560/vm-9560-disk-0.raw
# Add cloud init drive
qm set 9560 --ide2 xerxes-truenas:cloudinit
# Make the cloud init drive bootable and restrict BIOS to boot from disk only
qm set 9560 --boot c --bootdisk scsi0
# Add serial console
qm set 9560 --serial0 socket --vga serial0
# increase vdisk to 10gb
qm resize 9560 scsi0 +8G
# DO NOT START YOUR VM
# Make changes in proxmox webui for cloud-init settings, set net to dhcp, username, etc
# Create template
qm template 9560
# Clone template
qm clone 9560 561 --name docker01 --full
qm clone 9560 562 --name docker02 --full
qm clone 9560 563 --name docker03 --full
qm clone 9560 564 --name docker04 --full
qm clone 9560 565 --name docker05 --full
# Configure static ips on new clones in WEBUI
# Write code for this later
# INSIDE VM RUN:
