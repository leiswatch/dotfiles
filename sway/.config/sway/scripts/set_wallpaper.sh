#!/usr/bin/env bash

selected=$(swayimg --gallery "$HOME"/Pictures/Wallpapers)

if [[ -z $selected ]]; then
    exit 1
fi

escaped_path=$(echo "$selected" | sed 's/\//\\\//g')

sed -i "s/\(preload =\).*/\1 $escaped_path/g" "$HOME"/.config/hypr/hyprpaper.conf
sed -i "s/\(wallpaper =\).*/\1 \,$escaped_path/g" "$HOME"/.config/hypr/hyprpaper.conf
sed -i "s/\(path = \).*/\1$escaped_path/g" "$HOME"/.config/hypr/hyprlock.conf

# sh /home/leiswatch/.config/hypr/scripts/hyprpaper.sh
swww img "$selected" --transition-type center
# killall swaybg
# swaybg -i "$selected" -m "fill"
