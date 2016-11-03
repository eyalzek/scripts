#!/bin/bash
amixer -D pulse set Master toggle
if [ -n "$(pactl list sinks short |grep bluetooth)" ]; then
    pactl set-sink-mute 2 toggle
fi
