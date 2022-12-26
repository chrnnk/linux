# Stop the plexmediaserver service on your old plexmediaserver and your new plexmediaserver
sudo systemctl stop plexmediaserver
# Delete the existing library on the NEW server before migrating
sudo rm -rf /var/lib/plexmediaserver/Library
# Start rsync
sudo rsync -azvh nick@plex:/var/lib/plexmediaserver/ /var/lib/plexmediaserver/
# Upon completion, change the owner of the plexmediaserver directory to the plex user on your new plexmediaserver, Plex on Ubuntu requires this user to be the owner of the directory
sudo chown -R plex:plex /var/lib/plexmediaserver/
# Reboot your new plexmediaserver and test.
sudo reboot
# Open your web browser and point it to http://<new server ip address>:32400/web
