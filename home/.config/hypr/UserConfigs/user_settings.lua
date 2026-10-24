-- ==================================================
--  KoolDots (2026)
--  Project URL: https://github.com/LinuxBeginnings
--  License: GNU GPLv3
--  SPDX-License-Identifier: GPL-3.0-or-later
-- ==================================================
-- User settings overrides template.
-- Add your personal hl.config(...) values here.

hl.config({
  input = {
    kb_layout = "it",
    kb_variant = "",
    kb_model = "pc105",
    kb_options = "",
    kb_rules = "",
    repeat_rate = 50,
    repeat_delay = 300,
    sensitivity = 0,
    numlock_by_default = true,
    left_handed = false,
    follow_mouse = 1,
    float_switch_override_focus = false,
    touchpad = {
      disable_while_typing = true,
      natural_scroll = true,
      clickfinger_behavior = false,
      middle_button_emulation = false,
      tap_to_click = true,
      drag_lock = false,
    },
    touchdevice = {
      enabled = true,
    },
    tablet = {
      transform = 0,
      left_handed = 0,
    },
  },
})

-- Multi-language example:
-- NOTE: If specifying multiple layouts in kb_layout, kb_variant must have matching
-- comma separators (e.g. kb_layout = "fr,de", kb_variant = "azerty," or kb_variant = "").
--
-- hl.config({
--   input = {
--     kb_layout = "fr,de",
--     kb_variant = "azerty,",
--     kb_options = "grp:alt_shift_toggle",
--   },
--   misc = {
--     focus_on_activate = true,
--   },
-- })

-- Example:
-- hl.config({
--   general = {
--     gaps_in = 4,
--     gaps_out = 8,
--     border_size = 1,
--   },
-- })
--

-- Disable cursor being centered when swap workspaces
--
-- hl.config({
-- 	cursor = {
-- 		no_warps = true,
-- 		warp_on_change_workspace = 0,
-- 	},
-- })

-- Swipe orizzontale a 3 dita: passa alla finestra accanto (scrolling e altri layout)
hl.gesture({
  fingers = 3,
  direction = "left",
  action = function()
    hl.dispatch(hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/LayoutKeybindDispatch.sh focus-right"))
  end,
})

hl.gesture({
  fingers = 3,
  direction = "right",
  action = function()
    hl.dispatch(hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/LayoutKeybindDispatch.sh focus-left"))
  end,
})
