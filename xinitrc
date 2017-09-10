### x settings
xset r rate 250 25 # keyboard rate
xset mouse 20 30   # mouse settings
xset b off         # turn off bell

xset +fp ~/.fonts # add font directory to be loaded
xset fp rehash    # reload fonts

### autostart
nitrogen --restore & # restore wallpaper

megasync &  # mega client
nm-applet & # network monitor
pnmixer &   # volume control
slstatus &  # dwm status bar

sxhkd & # key commands

rmdesktop.sh &

screen.sh & # configure monitors

### window manager
wmname LG3D # fix JDK with dwm
dwmstart.sh # launch dwm
