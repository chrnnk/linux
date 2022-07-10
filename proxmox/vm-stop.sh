qm unlock 103
qm stop 103

#Identify who (process id) has the lock on the VM 
fuser /var/lock/qemu-server/lock-103.conf
#(for VM id 103)

#Kill the process
kill 48500
#(here process id 48500 for example)

qm stop 103
