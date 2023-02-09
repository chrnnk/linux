#!/bin/bash
setterm -term linux -blank 1 -powersave powerdown -powerdown 1 </dev/tty1 >/dev/tty1
# save to /root/screen-sleep.sh
# chmod +x ./screen-sleep.sh
# crontab -e
# @reboot /root/screen-sleep.sh
# 0 * * * * /root/screen-sleep.sh
# 10 * * * * /root/screen-sleep.sh
# 20 * * * * /root/screen-sleep.sh
# 30 * * * * /root/screen-sleep.sh
# 40 * * * * /root/screen-sleep.sh
# 50 * * * * /root/screen-sleep.sh
