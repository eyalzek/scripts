#!/bin/bash
amixer set Master playback 3dB-
if [ -n "$(pactl list sinks short |grep bluetooth)" ]; then
    pactl set-sink-volume 2 -- -3dB
fi
