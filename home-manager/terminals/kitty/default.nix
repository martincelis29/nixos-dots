{pkgs, ...}: {
  #*---------------------
  #* KITTY CONFIGURATION
  #*---------------------
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    font = {
      name = "FiraCode Nerd Font Mono";
      size = 14;
    };
    theme = "Catppuccin-Mocha";
    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      mouse_hide_wait = "1.0";
      cursor_shape = "beam";
      cursor_beam_thickness = "1.8";
      url_color = "#0087bd";
      url_style = "dotted";
      confirm_os_window_close = 0;
      background_opacity = "0.95";
      shell = "zsh";
      open_url_with = "firefox";
    };
    keybindings = {
      "ctrl+shift+plus" = "change_font_size all +2.0";
      "ctrl+shift+minus" = "change_font_size all -2.0";
    };
  };

  xdg.desktopEntries.kitty = {
    name = "Kitty";
    comment = "Fast, feature-rich, GPU based terminal";
    genericName = "Terminal emulator";
    icon = "kitty";
    exec = "kitty";
    categories = ["System" "TerminalEmulator"];
    type = "Application";
  };
}
