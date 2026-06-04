#!/bin/bash

# Toggle the master audio sink mute state
wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"; then
    notify-send -r 9999 -t 2000 "Audio" "System Volume Muted"
else
    notify-send -r 9999 -t 2000 "Audio" "System Volume Active"
fi