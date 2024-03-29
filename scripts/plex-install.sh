# -Plex Install (Debian Linux)-
sudo apt install apt-transport-https curl wget -y
echo deb [signed-by=/usr/share/keyrings/plex.gpg] https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
sudo wget -O- https://downloads.plex.tv/plex-keys/PlexSign.key | gpg --dearmor | sudo tee /usr/share/keyrings/plex.gpg
sudo apt update
sudo apt install plexmediaserver -y
reboot
# --REBOOT--
sudo systemctl status plexmediaserver
# Virtual Machine PCIe passthrough (Debian Linux)-
# Confirm GPU is being passed through-
lspci
# cronjob to keep phototranscoder cache clean
sudo crontab -e
0 2 * * * sudo find "/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Cache/PhotoTranscoder" -name "*.jpg" -type f -mtime +5 -delete
