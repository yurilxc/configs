#!bin/sh

#export LANG=zh_CN.UTF-8
#export LC_ALL="zh_CN.UTF-8"
xrdb -merge ~/.Xresources

xbindkeys 

# xinput --set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0
# export DISPLAY=":0.0"
# 
# xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
# xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
# xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200

# xbacklight -dec 10

# exec awesome
exec python2 /home/arkchar/github/qtile/bin/qtile

# exec ~/rc.d/sshgfw.py
