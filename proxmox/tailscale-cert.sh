# https://tailscale.com/kb/1133/proxmox
touch tailscale-cert.sh
nano tailscale-cert.sh
# #!/bin/bash
# NAME="$(tailscale status --json | jq '.Self.DNSName | .[:-1]' -r)"
# tailscale cert "${NAME}"
# pvenode cert set "${NAME}.crt" "${NAME}.key" --force --restart
chmod +x ./tailscale-cert.sh
crontab -e
31 3 * * 4 /bin/bash /root/tailscale-cert.sh