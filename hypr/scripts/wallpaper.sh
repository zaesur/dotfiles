#!/usr/bin/env bash
WALLPAPER=$(< "${HOME}/.cache/wal/wal")
sleep 1
hyprctl hyprpaper preload $WALLPAPER
hyprctl hyprpaper wallpaper DP-1,$WALLPAPER

