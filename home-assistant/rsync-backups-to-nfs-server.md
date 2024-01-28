### Home Assistant Add-on: Terminal & SSH
Follow these steps to get the add-on installed on your system:  
This add-on is only visible to "Advanced Mode" users. To enable advanced mode, go to Profile -> and turn on Advanced Mode.  
Navigate in your Home Assistant frontend to Settings -> Add-ons -> Add-on store.  
Find the "Terminal & SSH" add-on and click it.  
Click on the "INSTALL" button.  

The first step to configuring ssh key based authentication is to generate a key-pair on the host from which you will be initiating the connection.  
The host in this case is the home-assistant server.  
We use the ssh-keygen utility included with the OpenSSH suit included with most flavours of Linux.  
Generate a new key-pair with:  
```ssh-keygen -t ed25519```

```rsync -azvh /backup/ root@10.10.0.81:/mnt/user/backups/xerxes-home-assistant/```