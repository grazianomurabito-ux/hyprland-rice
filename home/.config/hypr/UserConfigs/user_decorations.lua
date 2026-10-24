-- ==================================================
--  KoolDots (2026)
--  Project URL: https://github.com/LinuxBeginnings
--  License: GNU GPLv3
--  SPDX-License-Identifier: GPL-3.0-or-later
-- ==================================================
-- User decorations overrides.
-- Dynamically loads Wallust generated colors from wallust-hyprland.conf.

local home = os.getenv("HOME") or ""
local helper_path = home .. "/.config/hypr/lua/user_decorations_helper.lua"
local ok, helper = pcall(dofile, helper_path)
local wallust = (ok and helper and helper.load_wallust_colors)
  and helper.load_wallust_colors(home .. "/.config/hypr/wallust/wallust-hyprland.conf")
  or {}

local active_col = "rgba(89b4faff)"
local inactive_col = "rgba(45475a88)"

hl.config({
  general = {
    border_size = 1,
    gaps_in = 30,
    gaps_out = 50,
    col = {
      active_border = active_col,
      inactive_border = inactive_col,
    },
  },
})

hl.config({
  decoration = {
    rounding = 10,
    active_opacity = 0.92,
    inactive_opacity = 0.92,
    fullscreen_opacity = 1.0,
    dim_inactive = false,
    dim_strength = 0.1,
    dim_special = 0.8,
    shadow = {
      enabled = true,
      range = 1,
      render_power = 1,
      color = active_col,
      color_inactive = inactive_col,
    },
     blur = {
      enabled = true,
      size = 10,
      passes = 3,
      noise = 0.05,
      contrast = 1.0,
      brightness = 1.0,
      vibrancy = 0.2,
      new_optimizations = true,
      xray = false,
      ignore_opacity = true,
      special = true,
      popups = true,
    },
  },
})

hl.config({
  group = {
    col = {
      border_active = wallust.color15 or active_col,
    },
    groupbar = {
      col = {
        active = wallust.color0 or "rgba(0f111aff)",
      },
    },
  },
})
