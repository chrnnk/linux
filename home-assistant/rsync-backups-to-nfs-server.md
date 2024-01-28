## Home Assistant Add-on: Terminal & SSH
Follow these steps to get the add-on installed on your system:  
    To enable advanced mode, go to Profile -> and turn on Advanced Mode.  
    Navigate in your Home Assistant frontend to Settings -> Add-ons -> Add-on store.  
    Find the "Terminal & SSH" add-on and click it.  
    Click on the "INSTALL" button.
## Testing rsync with password
In the below examples, replace ```USER``` with your NFS server's user, and ```IPADDRESS``` with your NFS server's IP address.  
If you're unsure and using Unraid, this would be ```root``` and your Unraid server's IP address.  

```rsync -azvh /backup/ USER@IPADDRESS:/mnt/user/backups/xerxes-home-assistant/```  

It should then ask you to verify the server you're connecting to, and then ask for the Unraid root user's password, in our example.  

If this works, continue on to the next section.  

If this doesn't work, troubleshoot until it does. Start by pinging your NFS server from the Home Assistant Terminal.  
## Testing rsync with SSH certificates
The first step to configuring ssh key based authentication is to generate a key-pair on the host from which you will be initiating the connection.  
The host in this case is the Home Assistant server.  
We use the ssh-keygen utility included with the OpenSSH suit included with most flavours of Linux.  
From the Home Assistant Terminal, generate a new key-pair with:  

```ssh-keygen -t ed25519```  

If you're unsure, accept defaults by pressing Enter.  
Next, copy the public key to the target NFS server.  
You can manually copy the public key (id_ed25519.pub) to the target NFS server, however, it’s much easier to use the ```ssh-copy-id``` utility included with the OpenSSH suit:  

```ssh-copy-id USER@IPADDRESS```  

It should then ask for the Unraid root user's password, in our example.  
You can test that this is working by typing ```ssh USER@IPADDRESS``` into the Home Assistant Terminal.  
If this worked, type ```exit``` to leave the SSH session and return to Home Assistant Terminal.  
If this didn't work, continue troubleshooting.  