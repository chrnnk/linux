## REQUIRED: Home Assistant Add-on: Terminal & SSH
Follow these steps to get the add-on installed on your system:  
- Enable advanced mode by going to Profile -> and turn on Advanced Mode.  
- Navigate in your Home Assistant frontend to Settings -> Add-ons -> Add-on store.  
- Find the "Terminal & SSH" add-on and click it.  
- Click on the "INSTALL" button.
## Testing rsync with password
Example: ```rsync -azvh /backup/ USER@IPADDRESS:/mnt/user/SHARENAME/SUBFOLDER/```  

Replace ```USER``` with your NFS server's user, and ```IPADDRESS``` with your NFS server's IP address.  

Replace ```SHARENAME``` and ```SUBFOLDER``` with your share and subfolder names you created for this backup.  

My SHARENAME is "backups" and for SUBFOLDER I use the name of the Home Assistant server "home-assistant-main".  

Once you have this ready, run the command. Mine looks like this:  
```rsync -azvh /backup/ root@192.168.1.5:/mnt/user/backups/home-assistant-main/```  

It should then ask you to verify the server you're connecting to, and then ask for the user's password.  

If this works, continue on to the next section.  

If this doesn't work, troubleshoot until it does. Start by pinging your NFS server from the Home Assistant Terminal.  
## Setting up rsync with SSH certificates
### Generate SSH key-pair on Home Assistant
The first step to configuring ssh key based authentication is to generate a key-pair on the host from which you will be initiating the connection. The host in this case is the Home Assistant server.  

From the Home Assistant Terminal, generate a new key-pair with:  

```ssh-keygen -t ed25519```  

If you're unsure, accept defaults by pressing Enter.  

### Copy the SSH public key to the target NFS server
You can manually copy the public key (id_ed25519.pub) to the target NFS server, however, it’s much easier to use the ```ssh-copy-id``` utility included with OpenSSH:  

```ssh-copy-id USER@IPADDRESS```  

It should then ask for the user's password.  

You can test that this is working with the following command in the Home Assistant Terminal:  

```ssh USER@IPADDRESS```  

If this worked, type ```exit``` to leave the SSH session and return to Home Assistant Terminal.  

### Create the backup script
Your terminal should now read ```[core-ssh ~]$ ```. If not, type ```cd ~```.  
Create and begin editing the backup script by typing:  

```nano ha-backup.sh```   

Replace ```root@192.168.1.5:/mnt/user/backups/home-assistant-main/``` in the code below with the command you made in the section "Testing rsync with password".  
Then copy and paste the following into the Home Assistant Terminal. If you're having issues pasting I reccommend ClickPaste on GitHub.  

```
#!/bin/bash
rsync -azvh /backup/ root@192.168.1.5:/mnt/user/backups/home-assistant-main/
```

Buns