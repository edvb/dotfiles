### x settings
xset r rate 250 25 # keyboard rate
xset mouse 20 30   # mouse settings
xset b off         # turn off bell

xinput set-button-map 15 1 1 1 # diable trackpad middle and right click

xset +fp ~/.fonts  # add font directory to be loaded
xset fp rehash     # reload fonts

### autostart
sh ~/.fehbg # restore wallpaper

megasync &  # mega client
nm-applet & # network monitor
pnmixer &   # volume control
slstatus &  # dwm status bar

sxhkd &     # key commands

xmodmap ~/bin/vim-keys.xmodmap
xcape -e 'Mode_switch=Escape'

screen.sh & # configure monitors

### window manager
wmname LG3D # fix JDK with dwm
dwmstart.sh # launch dwm
