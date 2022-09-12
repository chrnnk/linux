#!
## Change password after initial setup
passwd
## Add your user to sudo group
sudo usermod -aG sudo USERNAME
## ALLOW YOUR USER TO RUN SUDO WITHOUT PASSWORD PROMPT:
sudo EDITOR=nano visudo
# add the following line to the end of the file:
```
USERNAME    ALL=(ALL) NOPASSWD:ALL
```
## Log out and back in, test by running a command that previously needed sudo
