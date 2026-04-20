#!/bin/bash

# Check if an image path was provided
if [ -z "$1" ]; then
    echo "Please provide a wallpaper path! Example: setwall.sh /path/to/image.jpg"
    exit 1
fi

WALLPAPER=$1

echo "Applying new wallpaper and generating colors..."

# 1. Generate Material 3 colors for Quickshell
matugen image "$WALLPAPER"

# 2. Generate flat colors for your terminal/cava/peaclock
wal -i "$WALLPAPER" -q

# 3. Change the actual desktop wallpaper 
# (swww is the default wallpaper engine for most CachyOS/Hyprland setups)
swww img "$WALLPAPER" --transition-type wipe

# 4. Reload Hyprland to push the new colors to Quickshell
hyprctl reload

echo "Done! Colors updated."
