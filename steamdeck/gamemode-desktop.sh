#!/bin/sh
# Save this file, make it executable with chmod +x ./gamemode-desktop.sh or right click > properties > permissions
# Tick "Is executable" and then add it to Steam as a Non-Steam game
unset LD_PRELOAD
exec startplasma-wayland --xwayland --x11-display $DISPLAY --no-lockscreen --width 1280 --height 800 -- plasma_session
