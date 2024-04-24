{pkgs, ...}: let
  style = builtins.readFile ./config/style.css;
in {
  #*--------------------
  #* WOFI CONFIGURATION
  #*--------------------
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;
    settings = {
      ## General
      show = "drun";
      prompt = "Apps";
      normal_window = true;
      layer = "top";
      term = "kitty";
      columns = 2;

      ## Geometry
      width = "1000px";
      height = "750px";
      location = 0;
      orientation = "vertical";
      halign = "fill";
      line_wrap = "onn";
      dynamic_lines = false;

      ## Images
      allow_markup = true;
      allow_images = true;
      image_size = 55;

      ## Search
      exec_search = false;
      hide_search = false;
      parse_search = false;
      insensitive = false;

      ## Other
      hide_scroll = true;
      no_actions = true;
      sort_order = "default";
      gtk_dark = true;
      filter_rate = 100;

      ## Keys
      key_expand = "Tab";
      key_exit = "Escape";
    };
    style = style;
  };
}
