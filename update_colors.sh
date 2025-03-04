#!/bin/bash

# Pywal Farben-Datei
COLORS_JSON="$HOME/.cache/wal/colors.json"
ALACRITTY_CONFIG="$HOME/.config/alacritty/alacritty.toml"

# Überprüfen, ob die datein exestieren
if [ ! -f "$COLORS_JSON" ]; then
    echo "Fehler: colors.json-Datei nicht gefunden!"
    exit 1
fi

if [ ! -f "$ALACRITTY_CONFIG" ]; then
    echo "Fehler: Alacritty Konfigurationsdatei nicht gefunden!"
    exit 1
fi

# Farben aus der JSON-Datei extrahieren (verwendet jq, stelle sicher, dass jq installiert ist)
BACKGROUND=$(jq -r '.special.background' "$COLORS_JSON")
FOREGROUND=$(jq -r '.special.foreground' "$COLORS_JSON")
CURSOR=$(jq -r '.special.cursor' "$COLORS_JSON")
COLOR0=$(jq -r '.colors.color0' "$COLORS_JSON")
COLOR1=$(jq -r '.colors.color1' "$COLORS_JSON")
COLOR2=$(jq -r '.colors.color2' "$COLORS_JSON")
COLOR3=$(jq -r '.colors.color3' "$COLORS_JSON")
COLOR4=$(jq -r '.colors.color4' "$COLORS_JSON")
COLOR5=$(jq -r '.colors.color5' "$COLORS_JSON")
COLOR6=$(jq -r '.colors.color6' "$COLORS_JSON")
COLOR7=$(jq -r '.colors.color7' "$COLORS_JSON")
COLOR8=$(jq -r '.colors.color8' "$COLORS_JSON")
COLOR9=$(jq -r '.colors.color9' "$COLORS_JSON")
COLOR10=$(jq -r '.colors.color10' "$COLORS_JSON")
COLOR11=$(jq -r '.colors.color11' "$COLORS_JSON")
COLOR12=$(jq -r '.colors.color12' "$COLORS_JSON")
COLOR13=$(jq -r '.colors.color13' "$COLORS_JSON")
COLOR14=$(jq -r '.colors.color14' "$COLORS_JSON")
COLOR15=$(jq -r '.colors.color15' "$COLORS_JSON")

# fuer hypreland
ACTIVE_BORDER="0xFF$(echo $COLOR4 | sed 's/#//')"
INACTIVE_BORDER="0xFF$(echo $COLOR15 | sed 's/#//')"

FOREGROUND="0xFF${FOREGROUND//\#}"
BACKGROUND="0xFF${BACKGROUND//\#}"
CURSOR="0xFF${CURSOR//\#}"

#alac scripts
bash $HOME/Scripts/alacritty-color-export/script.sh

echo "$ACTIVE_BORDER"
echo "$INACTIVE_BORDER"
echo "$FOREGROUND"
echo "$BACKGROUND"
echo "$CURSOR"

sed -i "s#col.active_border =.*#col.active_border = $ACTIVE_BORDER#" ~/.config/hypr/lookandfeel.conf
sed -i "s#col.inactive_border =.*#col.inactive_border = $INACTIVE_BORDER#" ~/.config/hypr/lookandfeel.conf


# Qt-Theme-File (.conf) erstellen
cat <<EOF > ~/.config/qt5ct/styles/pywal-qt.conf
[General]
background = $BACKGROUND
foreground = $FOREGROUND
cursor = $CURSOR

[Colors]
color0 = $COLOR0
color1 = $COLOR1
color2 = $COLOR2
color3 = $COLOR3
color4 = $COLOR4
color5 = $COLOR5
color6 = $COLOR6
color7 = $COLOR7
EOF

echo "Qt-Theme mit Pywal-Farben erstellt."

