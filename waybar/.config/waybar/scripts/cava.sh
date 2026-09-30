#!/usr/bin/env bash
# tiny cava visualizer for waybar, prints nothing while it's silent

bars="▁▂▃▄▅▆▇█"
conf="${XDG_RUNTIME_DIR:-/tmp}/waybar-cava.conf"

cat > "$conf" <<CONF
[general]
bars = 10
framerate = 30
sleep_timer = 2

[input]
method = pipewire

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
bar_delimiter = 0
CONF

# cava prints one line of digits (0-7) per frame; map them onto block characters
exec cava -p "$conf" | while IFS= read -r line; do
    if [[ $line =~ ^0+$ ]]; then
        echo ""
    else
        out=""
        for (( i = 0; i < ${#line}; i++ )); do
            out+="${bars:${line:i:1}:1}"
        done
        echo "$out"
    fi
done
