#!/bin/sh
# Times the screen off and puts it to background
swayidle \
    timeout  3000 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &
# Locks the screen immediately
waylock
# Kills last background task so idle timer doesn't keep running
kill %%
