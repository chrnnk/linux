#!/bin/bash
setterm -term linux -blank 1 -powersave powerdown -powerdown 1 </dev/tty1 >/dev/tty1
# save to /root/screen-sleep.sh
# chmod +x ./screen-sleep.sh
# crontab -e
*/10 * * * * /root/screen-sleep.sh
