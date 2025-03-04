#!/bin/env sh

export XDG_SESSION_TYPE=wayland
export WAYLAND_DISPLAY=wayland-1
export XDG_CURRENT_DESKTOP=Hyprland

exec Hyprland 
