
The first step to configuring ssh key based authentication is to generate a key-pair on the host (home-assistant server) from which you will be initiating the connection. We use the ssh-keygen utility included with the OpenSSH suit included with most flavours of Linux.
Generate a new key-pair with: 
ssh-keygen -t ed25519

rsync -azvh /backup/ root@10.10.0.81:/mnt/user/backups/xerxes-home-assistant/