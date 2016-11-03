#!/bin/sh
xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --noprimary --output DP-3 --mode 1920x1080 --pos 3840x0 --rotate normal --noprimary --output DVI-I-1 --mode 1920x1080 --pos 1920x0 --rotate normal --primary
xfconf-query -c xfce4-panel -p /panels/panel-0/output-name -s monitor-1

