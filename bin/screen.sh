#!/usr/bin/env bash
if [[ `hostname -s` = carl-* ]]; then
	xrandr --output DVI-I-1 --mode 1600x900 --pos 1680x40 --rotate normal --output DVI-D-1 --mode 1680x1050 --pos 0x0 --rotate normal --primary --output DVI-D-2 --off
fi
