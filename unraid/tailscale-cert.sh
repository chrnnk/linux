tailscale cert xerxes-unraid.royal-mamba.ts.net
cat xerxes-unraid.royal-mamba.ts.net.crt >> xerxes-unraid.royal-mamba.ts.net.pem
cat xerxes-unraid.royal-mamba.ts.net.key >> xerxes-unraid.royal-mamba.ts.net.pem
cp xerxes-unraid.royal-mamba.ts.net.pem /boot/config/ssl/certs/xerxes-unraid.royal-mamba.ts.net.pem
cd /boot/config/ssl/certs
cp xerxes-unraid_unraid_bundle.pem xerxes-unraid_unraid_bundle.pem.old
rm -rf xerxes-unraid_unraid_bundle.pem
cp xerxes-unraid.royal-mamba.ts.net.pem xerxes-unraid_unraid_bundle.pem
reboot