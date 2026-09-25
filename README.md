# petiole dots

Arch + Hyprland (Lua config) + waybar + kitty + starship, in the petiole palette.

```
             _   _       _
 _ __   ___ | |_(_) ___ | | ___
| '_ \ / _ \| __| |/ _ \| |/ _ \
| |_) |  __/| |_| | (_) | |  __/
| .__/ \___| \__|_|\___/|_|\___|
|_|
```

## Layout

Each top-level folder is a stow package, mirroring paths relative to `~`:

| package  | links to                  |
|----------|---------------------------|
| hypr     | ~/.config/hypr            |
| waybar   | ~/.config/waybar          |
| kitty    | ~/.config/kitty           |
| cava     | ~/.config/cava            |
| rofi     | ~/.config/rofi            |
| starship | ~/.config/starship.toml   |
| zsh      | ~/.zshrc                  |

## Usage

```sh
cd ~/dotfiles
stow hypr            # link a package into place
stow -D hypr         # remove its links (files stay here)
stow -R hypr         # re-link after adding/removing files
```

Adding a new app: `mkdir -p newapp/.config && mv ~/.config/newapp newapp/.config/ && stow newapp`

## Undoing it for one app

```sh
cd ~/dotfiles
stow -D hypr
mv hypr/.config/hypr ~/.config/
```

## Deliberately not tracked

App state and profiles (dconf, zen, mozilla, obsidian, torbrowser, Bitwarden),
and mimeapps.list, which apps rewrite and would break the symlink.
