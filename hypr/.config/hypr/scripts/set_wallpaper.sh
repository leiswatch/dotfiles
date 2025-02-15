#!/usr/bin/env bash

selected=$(
    find /home/leiswatch/Pictures/Wallpapers -type f | sort | fzf --preview "sh /home/leiswatch/.config/hypr/scripts/fzf-preview.sh {}" --delimiter / --with-nth -1
)

if [[ -z $selected ]]; then
    exit 1
fi

# escaped_path=$(echo "$selected" | sed 's/\//\\\//g')

# sed -i "s/\(preload =\).*/\1 $escaped_path/g" /home/leiswatch/.config/hypr/hyprpaper.conf
# sed -i "s/\(wallpaper =\).*/\1 \,$escaped_path/g" /home/leiswatch/.config/hypr/hyprpaper.conf
# sed -i "s/\(path = \).*/\1$escaped_path/g" /home/leiswatch/.config/hypr/hyprlock.conf

# sh /home/leiswatch/.config/hypr/scripts/hyprpaper.sh
swww img "$selected" --transition-type center
