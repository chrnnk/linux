## Proxmox notes

### VM .conf location
```sh
/etc/pve/qemu-server/VMID.conf
```

### Change network
```sh
nano /etc/network/interfaces
```

### Check NUMA capabilities
```
numactl --hardware
```

### Force stop a stuck VM
```ssh
# Using VM ID 103 for example
qm unlock 103
qm stop 103
# Identify who (process id) has the lock on the VM 
fuser /var/lock/qemu-server/lock-103.conf
# Kill the process, here process id 48500 for example
kill 48500
qm stop 103
```

### ttek's LXC updater
```sh
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/update-lxcs.sh)"
```

below is from https://github.com/tteck/Proxmox

<details>
<summary markdown="span"> Proxmox VE 7 Post Install</summary>
 
<p align="center"><img src="https://github.com/home-assistant/brands/blob/master/core_integrations/proxmoxve/icon.png?raw=true" height="100"/></p>

<h1 align="center" id="heading"> Proxmox VE 7 Post Install </h1>

The script will give options to Disable the Enterprise Repo, Add/Correct PVE7 Sources, Enable the No-Subscription Repo, Add Test Repo, Disable Subscription Nag, Update Proxmox VE and Reboot PVE.
 
Run the following in the Proxmox Shell. ⚠️ **PVE7 ONLY**

```yaml
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/post-install.sh)"
```

It's recommended to answer `y` to all options.

____________________________________________________________________________________________ 

</details>

<details>
<summary markdown="span"> Proxmox Kernel Clean</summary>
 
<p align="center"><img src="https://github.com/home-assistant/brands/blob/master/core_integrations/proxmoxve/icon.png?raw=true" height="100"/></p>

<h1 align="center" id="heading">Proxmox Kernel Clean </h1>

Cleaning unused kernel images is not only good because of a reduced grub menu, but also gains some disk space.
 
Run the following in the Proxmox Shell.

```yaml
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/kernel-clean.sh)"
```
____________________________________________________________________________________________ 

</details>

<details>
<summary markdown="span"> Proxmox Edge Kernel Tool</summary>
 
<p align="center"><img src="https://github.com/home-assistant/brands/blob/master/core_integrations/proxmoxve/icon.png?raw=true" height="100"/></p>

<h1 align="center" id="heading">Proxmox Edge Kernel Tool </h1>

Proxmox [Edge Kernels](https://github.com/fabianishere/pve-edge-kernel) are custom Linux Kernels for Proxmox VE 7. Keeping up with new Kernel releases instead of LTS

Run the following in the Proxmox Shell.

```yaml
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/edge-kernel.sh)"
```
____________________________________________________________________________________________ 

</details>

<details>
<summary markdown="span"> Proxmox CPU Scaling Governor</summary>
 
<p align="center"><img src="https://github.com/tteck/Proxmox/blob/main/misc/images/cpu.png?raw=true" height="100"/></p>

<h1 align="center" id="heading">Proxmox CPU Scaling Governor </h1>

CPU Scaling Governor enables the operating system to scale the CPU frequency up or down in order to save power or improve performance.

[Generic Scaling Governors](https://www.kernel.org/doc/html/latest/admin-guide/pm/cpufreq.html?#generic-scaling-governors)
 
Run the following in the Proxmox Shell.

```yaml
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/scaling-governor.sh)"
```
____________________________________________________________________________________________ 

</details>

<details>
<summary markdown="span"> Proxmox LXC Updater</summary>
 
<p align="center"><img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Felpuig.xeill.net%2FMembers%2Fvcarceler%2Farticulos%2Fcontenedores-con-lxd-lxc%2Fcontainers.png&f=1&nofb=1" height="100"/></p>

<h1 align="center" id="heading">Proxmox LXC Updater </h1>

Update All LXC's Fast & Easy
 
Run the following in the Proxmox Shell.

```yaml
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/update-lxcs.sh)"
```
____________________________________________________________________________________________ 

</details>

<details>
<summary markdown="span"> Proxmox Dark Theme</summary>
 
<p align="center"><img src="https://camo.githubusercontent.com/f6f33a09f8c1207dfb3dc1cbd754c2f3393562c11b1c999751ad9a91a656834a/68747470733a2f2f692e696d6775722e636f6d2f536e6c437948462e706e67" height="100"/></p>

<h1 align="center" id="heading"> Proxmox Discord Dark Theme </h1>

A dark theme for the Proxmox Web UI by [Weilbyte](https://github.com/Weilbyte/PVEDiscordDark)
 
Run the following in the Proxmox Shell.

```yaml
bash <(curl -s https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.sh ) install
```

To uninstall the theme, simply run the script with the `uninstall` command.

____________________________________________________________________________________________ 

</details>

<details>
<summary markdown="span"> Webmin System Administration</summary>
 
<p align="center"><img src="https://github.com/webmin/webmin/blob/master/images/webmin-blue.png?raw=true" height="100"/></p>

<h1 align="center" id="heading"> Webmin System Administration </h1>

To Install Webmin System Administration [(Screenshot)](https://raw.githubusercontent.com/tteck/Proxmox/main/misc/images/file-manager.png), ⚠️ run the following in the LXC console.

```yaml
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/misc/webmin.sh)"
```

If you prefer to manage all aspects of your Proxmox LXC from a graphical interface instead of the command line interface, Webmin might be right for you.

Benefits include automatic daily security updates, backup and restore, file manager with editor, web control panel, and preconfigured system monitoring with optional email alerts.



**Webmin Interface - https:// IP:10000 (https)**

⚙️ **Initial Login**

**username** 
 ```yaml
 root
 ```
 **password** 
 ```yaml
 root
 ```
 
⚙️ **To Update Webmin**

```yaml
Update from the Webmin UI
```
⚙️ **To Uninstall Webmin**
 
Run in the LXC console
```yaml
bash /etc/webmin/uninstall.sh
```
___________________________________________________________________________________________ 

</details>
