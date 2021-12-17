#!/bin/bash
xrdb -load .Xresources &
xcompmgr &
bluetooth off &
feh --no-fehbg --bg-tile '/home/ethan/.wall/pipePattern.png' &
linux-amd64-etesync-dav >> /dev/null &
syncthing --no-browser >> /dev/null &
~/.dwm/mouse.sh &
~/.dwm/bartime.sh &
exec dwm
