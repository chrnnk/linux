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

### NOT WORKING - Create the backup script
This section is not working yet. Seems like scripts saved in /root/ are not persistent after a reboot and disappear. 

Same with the crontab entry.  

However, the backup job will still work when ran manually from the terminal with ```rsync -azvh /backup/ root@192.168.1.5:/mnt/user/backups/home-assistant-main/```.  

Your terminal should now read ```[core-ssh ~]$ ```. If not, type ```cd ~```.  

Create and begin editing the backup script by typing:  

```nano ha-backup.sh```   

Replace the second line in the code below with the command you made in the section "Testing rsync with password".  

```
#!/bin/bash
rsync -azvh /backup/ root@192.168.1.5:/mnt/user/backups/home-assistant-main/
```

Save it with ```CTRL+S```, then exit nano with ```CTRL+X```.  

Now make the script executable by running:  

```chmod +x ha-backup.sh```

Before we schedule it, let's make sure the script works when run manually:  

```./ha-backup.sh```

Now we can schedule it with crontab:

```EDITOR=nano crontab -e```

Paste the following line at the end to make the script run at 1am daily:  

```0 1 * * * /bin/bash /root/ha-backup.sh```

Save it with ```CTRL+S```, then exit nano with ```CTRL+X```.  

Test it by deleting the Home Assistant backups on your NFS server, then check again tomorrow after 1am to be sure the script ran.  