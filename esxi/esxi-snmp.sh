# ESXi 8.0
esxcli system snmp set -c=YOUR_COMMUNITY_STRING
esxcli system snmp set -e=true
# ESXi 7.0
esxcli system snmp set --communities YOUR_COMMUNITY_STRING
esxcli system snmp set --enable true
# ESXi 6.x
esxcli system snmp set -r
esxcli system snmp set -c YOUR_COMMUNITY_STRING
esxcli system snmp set -p 161
esxcli system snmp set -L "City, State, Country"
esxcli system snmp set -C noc@example.com
esxcli system snmp set -e yes
