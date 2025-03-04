#!/bin/bash

DEFAULT_WALLPAPER="/home/stb/Pictures/wallpapers/bruchtahl.jpg"

if [ -z "$1" ]; then
    echo "Fehler: Kein Bildpfad angegeben."
    exit 1
fi

wallpaper_path=$1

if [ ! -f "$wallpaper_path" ]; then
    echo "Warnung: Bild existiert nicht. Standard-Wallpaper wird verwendet."
    wallpaper_path="$DEFAULT_WALLPAPER"
fi

export wallpaper_path

wal -i "$wallpaper_path"

# Konfigurationsdatei aktualisieren
CONFIG_FILE="/home/stb/.config/hypr/hyprpaper.conf"

cat > "$CONFIG_FILE" <<EOL
preload = $wallpaper_path

wallpaper = DP-1, $wallpaper_path
wallpaper = DP-2, $wallpaper_path
wallpaper = HDMI-A-1, $wallpaper_path

EOL

# Hyprpaper neu starten
pkill hyprpaper 
hyprpaper &

echo "doing color stuff"
bash ~/Scripts/update_colors.sh
echo "fertig"
