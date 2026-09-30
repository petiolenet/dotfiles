-- Autostart, adjust as needed for whatever your crazed mind plans on making.

hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar")
    hl.exec_cmd("mako")
    hl.exec_cmd("~/.config/hypr/scripts/wallpaper.sh restore") -- starts hyprpaper
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
