# -Plex Install (Debian Linux)-
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
sudo apt update
sudo apt install plexmediaserver
sudo mkdir /PlexMedia
sudo nano /etc/fstab
# Add to bottom of file
//PATH-TO-FILE-SERVER /PlexMedia cifs username=$$$$$$$$,password=######## 0 0
# Save file and exit
reboot
# --REBOOT--
cd /PlexMedia
# Verify files from your file server are showing up here
ls
# Virtual Machine PCIe passthrough (Debian Linux)-
# Confirm GPU is being passed through-
lspci