#!/bin/bash

# /boot/config/tailscale/start.sh

exec >/tmp/tailscaled.log 2>&1
setsid /usr/sbin/tailscaled -statedir=/boot/config/tailscale/ &