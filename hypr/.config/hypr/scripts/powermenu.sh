#!/usr/bin/env bash
# rofi power menu (SUPER + M)

options="󰐥  shutdown
󰜉  reboot
󰤄  suspend
󰍃  logout"

choice=$(printf '%s\n' "$options" | rofi -dmenu -i -p "power" \
    -theme-str 'window { width: 16%; } listview { columns: 1; lines: 4; }')

case "$choice" in
    *shutdown) systemctl poweroff ;;
    *reboot)   systemctl reboot ;;
    *suspend)  systemctl suspend ;;
    *logout)   command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()' ;;
esac
