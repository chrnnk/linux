qm resize 9560 scsi0 +7.988G
# inside linux vm if running lvm
lvdisplay 
sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
lvdisplay 
cd /
df -h
resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
df -h
# inside linux vm if running lvm
df -TH
lsblk
growpart /dev/vda 2
resize2fs /dev/vda2
