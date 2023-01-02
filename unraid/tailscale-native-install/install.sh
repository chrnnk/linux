#!/bin/bash

# /boot/config/tailscale/install.sh

tar -xf /boot/config/tailscale/tailscale_static.tgz -C /usr/bin/ --strip-components=1 --no-anchored tailscale
tar -xf /boot/config/tailscale/tailscale_static.tgz -C /usr/sbin/ --strip-components=1 --no-anchored tailscaled