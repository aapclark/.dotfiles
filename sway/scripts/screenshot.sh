#!/bin/bash

XDG_SCREENSHOTS_DIR="~/Pictures/Screenshots"

entries="Active Screen Output Area Window"

selected=$(printf '%s\n' $entries | fuzzel -d --lines=4 | awk '{print tolower($1)}')

case $selected in
  active)
    grimshot save output --notify ;;
  screen)
    grimshot save output --notify ;;
  output)
    grimshot save output --notify ;;
  area)
    grimshot save area --notify ;;
  window)
    grimshot save active --notify ;;
esac
