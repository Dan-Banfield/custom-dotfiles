#!/bin/bash

OVERRIDE_FILE="/tmp/nightlight_override"
HOUR=$(date +%H)

if [ "$HOUR" -ge 20 ] || [ "$HOUR" -lt 7 ]; then
    IS_NIGHT_TIME=true
else
    IS_NIGHT_TIME=false
fi

if [ "$1" == "--toggle" ]; then
    if [ -f "$OVERRIDE_FILE" ]; then
        rm "$OVERRIDE_FILE"
        if [ "$IS_NIGHT_TIME" == "true" ]; then
            hyprctl hyprsunset temperature 5000
            hyprctl hyprsunset gamma 60
        else
            hyprctl hyprsunset identity
        fi
    else
        touch "$OVERRIDE_FILE"
        if [ "$IS_NIGHT_TIME" == "true" ]; then
            hyprctl hyprsunset identity
        else
            hyprctl hyprsunset temperature 4000
        fi
    fi
    pkill -RTMIN+8 waybar
    exit 0
fi

if [ -f "$OVERRIDE_FILE" ]; then
    [ "$IS_NIGHT_TIME" == "true" ] && echo "󰖨" || echo "󰖔"
else
    [ "$IS_NIGHT_TIME" == "true" ] && echo "󰖔" || echo "󰖨"
fi
