#!/usr/bin/env bash
# clipboard history picker (SUPER + SHIFT + V), needs cliphist

cliphist list | rofi -dmenu -i -p "clip" -display-columns 2 | cliphist decode | wl-copy
