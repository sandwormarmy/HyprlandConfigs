#!/bin/bash

# Hintergrundbild ermitteln
CURRENT_WALLPAPER=$(hyprpaper -q)

# Sperrbildschirm aktivieren
swaylock --image "$CURRENT_WALLPAPER" --indicator --effect-blur 7x5
