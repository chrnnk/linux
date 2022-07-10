#!
## Change password after initial setup
passwd
## ALLOW YOUR USER TO RUN SUDO WITHOUT PASSWORD PROMPT:
sudo EDITOR=nano visudo
# add the following line to the end of the file:
```
USERNAME    ALL=(ALL) NOPASSWD:ALL
```
## UPDATE ALL, REBOOT IF NEEDED
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y