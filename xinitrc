### autostart
nitrogen --restore & # restore wallpaper

xset r rate 250 25 # keyboard rate
xset mouse 20 30   # mouse settings
xset b off         # turn off bell

xset +fp ~/.fonts # add font directory to be loaded
xset fp rehash    # reload fonts

wmname LG3D # fix JDK with dwm

megasync &            # mega client
nm-applet &           # network monitor
pnmixer &             # volume control
xfce4-power-manager & # enable power management

screen.sh & # configure monitors

### window manager
dwmstatus.sh &
exec dwm
