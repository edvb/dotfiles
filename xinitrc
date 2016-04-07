### autostart
nitrogen --restore &  # restore background

xfce4-volumed &        # volume keys daemon
xfce4-power-manager &  # enable power management

xset r rate 250 25 # keyboard rate
xset mouse 20 30   # mouse settings
xset b off         # turn off bell

xset +fp ~/.fonts # add font directory to be loaded
xset fp rehash    # reload fonts

nm-applet &

screen.sh &


### window manager
exec dwm
