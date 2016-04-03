### autostart
nitrogen --restore &  # restore wallpaper

xfce4-volumed &        # volume keys daemon
xfce4-power-manager &  # enable power manager

xset r rate 250 25 # keyboard rate
xset mouse 20 30   # mouse settings
xset b off         # turn off bell

nm-applet &

screen.sh &


### window manager
exec dwm
