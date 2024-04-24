local wezterm = require 'wezterm'

return {
   font = wezterm.font("FiraCode Nerd Font Mono"),
   font_size = 14.0,
   default_prog = { 'zsh' },
   color_scheme = "Catppuccin Mocha",
      window_frame = {
      active_titlebar_bg = '#333333',
      inactive_titlebar_bg = '#333333',
   },
   use_fancy_tab_bar = true,
   default_cursor_style = 'BlinkingBar',
   window_close_confirmation = 'NeverPrompt',
   hide_tab_bar_if_only_one_tab = true,
   enable_scroll_bar = false;
   window_padding = {
      top    = '0.5cell',
      right  = '1cell',
      bottom = '0.5cell',
      left   = '1cell',
   },
   inactive_pane_hsb = {
      saturation = 0.9,
      brightness = 0.8,
   },
   window_background_opacity = 0.95,
   text_background_opacity = 1.0,
}