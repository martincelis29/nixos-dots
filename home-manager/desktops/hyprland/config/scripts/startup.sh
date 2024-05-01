#!/usr/bin/env bash

# Wallpaper
swww query || swww init
swww img $HOME/Pictures/Leaves.png --transition-step 230 --transition-fps 60 --transition-type grow --transition-angle 30 --transition-duration 3

# Polkit Authenticator
#/nix/store/$(ls -la /nix/store | grep 'polkit-gnome' | grep '4096' | awk '{print $9}' | sed -n '$p')/libexec/polkit-gnome-authentication-agent-1 &
systemctl --user start polkit-gnome-authentication-agent-1 &

# A notification daemon
dunst &

# Cursor
hyprctl setcursor capitaine-cursors 24

# Systray app for Network/Wifi
nm-applet --indicator &

# Day/night gamma adjustments for Wayland
sleep 1 && wlsunset -T 5000 -t 4500 &

# Mute Microphone
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1

# Fix apps like gparted not staring (error: cannot open display: :0) source: https://askubuntu.com/questions/939938/gparted-cannot-open-display
xhost +local:
