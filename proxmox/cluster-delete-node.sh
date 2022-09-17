#!
# first of all, stop breaking the cluster
pvecm status
# command below sets the quorom to 1 (if you had 2 nodes. if you have 3 nodes and 2 are still online set this to 2)
pvecm expected 1
pvecm nodes
pvecm delnode NODENAME
cd /etc/pve/nodes
ls
# delete the old node's folder
rm -rf NODENAME/
