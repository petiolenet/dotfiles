# palette proof of concept

one colour file -> every app. **not wired up**, nothing here touches the real configs.

```
./render.sh      # fills templates/* from palette.conf into out/
```

the check that it works: the rendered files match what's hand-written right now

```
diff out/palette.lua ../hypr/.config/hypr/modules/palette.lua
diff out/waybar-colors.css <(head -17 ../waybar/.config/waybar/style.css)
```

## if it becomes real
1. each app keeps its colours in a separate small file (waybar `colors.css`, rofi `colors.rasi`, ...)
   and the main config imports it (`@import "colors.css";`, `@import "colors"`)
2. `render.sh` writes straight to those files instead of `out/`
3. add templates for kitty, starship, swayosd, cava, hyprland borders
4. then `./render.sh && hyprctl reload && pkill -SIGUSR2 waybar` recolours everything
