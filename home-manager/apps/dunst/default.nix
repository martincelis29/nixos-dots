{pkgs, ...}: {
  #*---------------------
  #* DUNST CONFIGURATION
  #*---------------------
  services.dunst = {
    enable = true;
    package = pkgs.dunst;
    settings = {
      global = {
        monitor = 0;
        follow = "none";
        width = "(100, 350)";
        height = 500;
        origin = "bottom-right";
        offset = "20x20";
        scale = 0;
        notification_limit = 0;
        progress_bar = true;
        progress_bar_height = 5;
        progress_bar_frame_width = 0;
        progress_bar_min_width = 0;
        progress_bar_max_width = 300;
        progress_bar_corner_radius = 2;
        icon_corner_radius = 12;
        indicate_hidden = "yes";
        transparency = 0;
        separator_height = 2;
        padding = 10;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 4;
        frame_color = "#0f0f0f";
        gap_size = 4;
        separator_color = "frame";
        sort = "yes";
        font = "Noto Sans 11";
        line_height = 0;
        markup = "full";
        format = "<span size='12000' font_desc='Noto Sans' weight='500' foreground='#c49ec4'>%s</span>\n%b";
        alignment = "center";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";
        enable_recursive_icon_lookup = true;
        icon_theme = "Papirus-Dark";
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 128;
        sticky_history = "yes";
        history_length = 20;
        browser = "/usr/bin/xdg-open";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 12;
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;
        mouse_left_click = "close_current";
        mouse_middle_click = "close_current";
        mouse_right_click = "close_all";
      };
      experimental = {
        per_monitor_dpi = false;
      };
      urgency_low = {
        background = "#0f0f0f";
        foreground = "#f0f0f0";
        timeout = 10;
      };
      urgency_normal = {
        background = "#0f0f0f";
        foreground = "#f0f0f0";
        timeout = 10;
      };
      urgency_critical = {
        background = "#0f0f0f";
        foreground = "#f0f0f0";
        timeout = 0;
      };
    };
  };
}
