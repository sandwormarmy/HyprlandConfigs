#!/bin/bash

# Default microphone source
MIC_SOURCE=$(pactl list sources short | grep -i "input" | awk '{print $2}' | head -n 1)

# Get mute status
get_mute_status() {
    pactl list sources | grep -A 15 "$MIC_SOURCE" | grep "Mute:" | awk '{print $2}'
}

# Function to toggle mute
toggle_mute() {
    pactl set-source-mute "$MIC_SOURCE" toggle
}

# Function to increase volume
increase_volume() {
    pactl set-source-volume "$MIC_SOURCE" +5%
}

# Function to decrease volume
decrease_volume() {
    pactl set-source-volume "$MIC_SOURCE" -5%
}

# Output the current icon based on mute status
output_icon() {
    if [ "$(get_mute_status)" = "yes" ]; then
        echo " Muted"  # Icon for muted
    else
        echo " Unmuted"  # Icon for unmuted
    fi
}

# Handle input arguments
case "$1" in
    -m) toggle_mute ;;
    -i) increase_volume ;;
    -d) decrease_volume ;;
    -s) output_icon ;;  # Output icon
    *) echo "Usage: $0 [-m | -i | -d | -s]" ;;
esac
