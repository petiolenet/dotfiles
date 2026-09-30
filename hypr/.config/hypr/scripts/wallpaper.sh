#!/usr/bin/env bash
# wallpaper picker (SUPER + W)
# the current wallpaper is a symlink that hyprpaper.conf points at,
# so the choice survives restarts without editing the tracked config
#
#   wallpaper.sh           open the picker
#   wallpaper.sh restore   make sure the symlink exists, then start hyprpaper

dir="$HOME/Pictures/wallpapers"
current="$HOME/.cache/current-wallpaper"

if [ "$1" = "restore" ]; then
    [ -e "$current" ] || ln -sf "$(find "$dir" -maxdepth 1 -type f | sort | head -n1)" "$current"
    exec hyprpaper
fi

choice=$(
    find "$dir" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) \
        | sort | while read -r img; do
            printf '%s\0icon\x1f%s\n' "$(basename "$img")" "$img"
        done \
        | rofi -dmenu -i -p "wall" -show-icons -theme "$HOME/.config/rofi/themes/wallpaper.rasi"
)

[ -n "$choice" ] || exit 0

ln -sf "$dir/$choice" "$current"
hyprctl hyprpaper wallpaper ",$dir/$choice" >/dev/null
