# Hyprland rice: glass

My Hyprland rice on **Pop!_OS 24.04**, built on top of the
[KooL / JaKooLit dotfiles](https://github.com/LinuxBeginnings/Hyprland-Dots) (Ubuntu 24.04 branch).
COSMIC stays installed as an alternative session, selectable at login.

## What's mine
- **Glass everywhere**: uniform opacity for active and inactive windows, blur, per-app rules
- **Vertical workspaces**: `slidevert` animation, 3-finger up/down swipe, COSMIC-style shortcuts
- **Scrolling layout** with 3-finger horizontal swipe to move between windows
- **Waybar** floating off the screen edge, rounded corners, Apps button
- **Grid launcher** for rofi (`glass-grid.rasi`) using wallust colors
- **Theme-aware wallpapers**: `wallsort.py` splits wallpapers into dark/light sets,
  `wallmode` picks the set, `wallauto` switches between dark and light by time of day

## Layout
`home/` mirrors the home directory: every file goes to the same path under `~`.

## Installation
1. Install Hyprland and the KooL dotfiles with the Ubuntu 24.04 installer
2. Copy this repository's files on top: `cp -r home/. ~/`
3. Log out and back in to the Hyprland session

## Updating the repository
```bash
./sync.sh
git add -A && git commit -m "describe the change" && git push
```
