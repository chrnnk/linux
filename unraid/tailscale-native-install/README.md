From Shayne  
https://gist.github.com/shayne/25e194e068751e281937ef68edefb99b  
He recommends using another script to install, but I just ran the user-script after setting up the other two scripts at /boot/config/tailscale/ and it worked.  
```
cd /boot/config/
mkdir tailscale
cd tailscale
touch install.sh start.sh
nano install.sh
nano start.sh
chmod +x install.sh start.sh
```
copy contents of install.sh here and save
```
bash ./install.sh
```
copy contents of start.sh here and save  
```
bash ./start.sh
```
make user script in unraid, set to run daily  
copy contents of user-script.sh here and save, then run it  
```
tailscale login
tailscale up --ssh
```
