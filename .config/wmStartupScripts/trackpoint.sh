#! /bin/bash
# configure sensitivity path "/etc/udev/rules.d"

## Integrated TrackPoint
# enable horizontal and vertical scrolling using middle button
xinput --set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput --set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput --set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput --set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

# disable touchpad
xinput --set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0

## External lenovo kb with trackpoint
# enable horizontal and vertical scrolling using middle button
xinput --set-prop pointer:"Lite-On Technology Corp. ThinkPad USB Keyboard with TrackPoint" "Evdev Wheel Emulation" 1
xinput --set-prop pointer:"Lite-On Technology Corp. ThinkPad USB Keyboard with TrackPoint" "Evdev Wheel Emulation Button" 2
xinput --set-prop pointer:"Lite-On Technology Corp. ThinkPad USB Keyboard with TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput --set-prop pointer:"Lite-On Technology Corp. ThinkPad USB Keyboard with TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

## Alps using 0.10 from http://people.canonical.com/~sforshee/alps-touchpad/
# enable horizontal and vertical scrolling using middle button
xinput --set-prop "DualPoint Stick" "Evdev Wheel Emulation" 1
xinput --set-prop "DualPoint Stick" "Evdev Wheel Emulation Button" 2
xinput --set-prop "DualPoint Stick" "Evdev Wheel Emulation Timeout" 200
xinput --set-prop "DualPoint Stick" "Evdev Wheel Emulation Axes" 6 7 4 5

# switch to another accel profile
xinput --set-prop "DualPoint Stick" "Device Accel Profile" 3

# disable touchpad
xinput --set-prop "AlpsPS/2 ALPS DualPoint TouchPad" "Device Enabled" 0
