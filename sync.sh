#!/usr/bin/env bash
# Copia nel repository i file personalizzati del rice.
# I percorsi sono relativi alla home e vengono ricreati dentro home/.
set -euo pipefail
REPO="$(cd "$(dirname "$0")" && pwd)"

FILES=(
  .config/hypr/UserConfigs/monitors.lua
  .config/hypr/UserConfigs/user_animations.lua
  .config/hypr/UserConfigs/user_decorations.lua
  .config/hypr/UserConfigs/user_keybinds.lua
  .config/hypr/UserConfigs/user_layer_rules.lua
  .config/hypr/UserConfigs/user_settings.lua
  .config/hypr/UserConfigs/user_startup.lua
  .config/hypr/UserConfigs/user_window_rules.lua
  .config/hypr/UserConfigs/workspaces.lua
  .config/hypr/UserConfigs/kitty.conf
  .config/hypr/lua/settings.lua
  .config/hypr/lua/window_rules.lua
  .config/hypr/waybar/UserModules
  .config/hypr/waybar/configs/TOP-Minimal-Short
  .config/hypr/waybar/style/Transparent-Crystal-Clear.css
  .config/hypr/rofi/themes/glass-grid.rasi
  .local/bin/wallmode
  .local/bin/wallsort.py
  .local/bin/wallauto
  .local/bin/applauncher
  .local/bin/spritefetch
  .bashrc
)

cd "$HOME"
for f in "${FILES[@]}"; do
  if [ -e "$f" ]; then
    mkdir -p "$REPO/home/$(dirname "$f")"
    cp "$f" "$REPO/home/$f"
    echo "copiato  $f"
  else
    echo "manca    $f"
  fi
done

echo
echo "Controllo dati sensibili (da verificare prima del commit):"
grep -rn -i -E "api[_-]?key|token|secret|passw" "$REPO/home" || echo "  nessuna corrispondenza"
