# Source: symlink plex
# https://support.plex.tv/articles/201370363-move-an-install-to-another-system/
# What you wanna do is stop the Plex service On systemd it's
sudo systemd stop plexmediaserver.service
# Then copy the Plex data for to a new place
cp -rf /var/lib/plexmediaserver/Library/Application\ Support /new/path
# Backup the old stuff In-case
mv /var/lib/plexmediaserver/Library/Application\ Support /var/lib/plexmediaserver/Library/Application\ Support.OLD
# Then do
ln -s /new/Plex/path/Application\ Support /var/lib/plexmediaserver/Library/Application\ Support
# Then chown the new path
sudo chown -R plex:plex /var/lib/plexmediaserver/Library/Application\ Support
# Then restart plex
sudo systemctl start plexmediaserver.service
