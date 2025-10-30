#!/bin/bash

entries="Logout Suspend Reboot Shutdown"

selected=$(printf '%s\n' $entries | fuzzel -d --lines=4 | awk '{print tolower($1)}')

case $selected in
  logout)
    session_id=$(loginctl show-user "$USER" -p Display --value)
    if [ -n "$session_id" ]; then
      loginctl terminate-session "$session_id"
    else
      swaymsg exit
    fi
    ;;
  suspend)
    systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
