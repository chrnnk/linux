sudo passwd debian
mkdir .ssh
cd .ssh
touch authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMw4F/gxCmCiWdmqLmtPbZTObzzmlwWLh2SosqKdLzZl nick@chrxnn.com" >> ~/.ssh/authorized_keys
