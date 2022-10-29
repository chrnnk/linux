#!/bin/bash

echo "${USER}  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers
## ALLOW YOUR USER TO RUN SUDO WITHOUT PASSWORD PROMPT:
# sudo EDITOR=nano visudo
# add the following line to the end of the file:
# USERNAME    ALL=(ALL) NOPASSWD:ALL
## Log out and back in, test by running a command that previously needed sudo
