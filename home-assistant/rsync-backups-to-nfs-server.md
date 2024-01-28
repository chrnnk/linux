## Home Assistant Add-on: Terminal & SSH
#### Follow these steps to get the add-on installed on your system:  
To enable advanced mode, go to Profile -> and turn on Advanced Mode.  
Navigate in your Home Assistant frontend to Settings -> Add-ons -> Add-on store.  
Find the "Terminal & SSH" add-on and click it.  
Click on the "INSTALL" button.  
## Testing rsync with password
Replace USER with your a user from your NFS server that has write permissions. If you're using Unraid and don't know, use root.  
Replace IPADDRESS with the IP address for your NFS server that has the backup folder for Home Assistant. If you're using Unraid and don't know, use your Unraid server's IP address.  
```rsync -azvh /backup/ USER@IPADDRESS:/mnt/user/backups/xerxes-home-assistant/```
It should ask you to verify the server you're connecting to, and then ask for the Unraid root user's password, in our example.  
## Testing rsync with SSH certificates
The first step to configuring ssh key based authentication is to generate a key-pair on the host from which you will be initiating the connection.  
The host in this case is the home-assistant server.  
We use the ssh-keygen utility included with the OpenSSH suit included with most flavours of Linux.  
Generate a new key-pair with:  
```ssh-keygen -t ed25519```
```rsync -azvh /backup/ root@10.10.0.81:/mnt/user/backups/xerxes-home-assistant/```