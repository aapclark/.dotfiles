#!/bin/sh

fuzzel -f LeaugeMonoNarrow:size=11 -w 64 -b 002b36ff -t 839496ff -dpi-aware yes \
	-m dc322fff -s 073642ff -B 2 -r 0 -C 839496ff $@ <&0
