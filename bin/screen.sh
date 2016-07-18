#!/usr/bin/env bash

# srceen.sh: handle my multi-screen setup
#
# Run this command every time you boot up so these settings are loaded.
#

if [[ $(hostname -s) = carl-* ]]; then
	xrandr --output DVI-I-1 --mode 1600x900 --pos 1680x40 --rotate normal --output DVI-D-1 --mode 1680x1050 --pos 0x0 --rotate normal --primary --output DVI-D-2 --off
fi
