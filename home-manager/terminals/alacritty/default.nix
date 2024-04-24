{pkgs, ...}: {
  #*-------------------------
  #* ALACRITTY CONFIGURATION
  #*-------------------------
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = {
      env.TERM = "alacritty";
      dynamic_title = true;
      dynamic_padding = true;
      shell = {
        program = "zsh";
      };
      window = {
        title = "Alacritty";
        decorations = "full";
        opacity = 0.85;
        startup_mode = "Windowed";
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font Mono";
          style = "Regular";
        };
        bold = {
          family = "FiraCode Nerd Font Mono";
          style = "Bold";
        };
        italic = {
          family = "FiraCode Nerd Font Mono";
          style = "Italic";
        };
        bold_italic = {
          family = "FiraCode Nerd Font Mono";
          style = "Bold Italic";
        };
        size = 14;
      };
      colors = {
        primary = {
          background = "#1E1E2E";
          foreground = "#CDD6F4";
          dim_foreground = "#CDD6F4";
          bright_foreground = "#CDD6F4";
        };
        cursor = {
          text = "#1E1E2E";
          cursor = "#F5E0DC";
        };
        vi_mode_cursor = {
          text = "#1E1E2E";
          cursor = "#B4BEFE";
        };
        search = {
          matches = {
            foreground = "#1E1E2E";
            background = "#A6ADC8";
          };
          focused_match = {
            foreground = "#1E1E2E";
            background = "#A6E3A1";
          };
          footer_bar = {
            foreground = "#1E1E2E";
            background = "#A6ADC8";
          };
        };
        hints = {
          start = {
            foreground = "#1E1E2E";
            background = "#F9E2AF";
          };
          end = {
            foreground = "#1E1E2E";
            background = "#A6ADC8";
          };
        };
        selection = {
          text = "#1E1E2E";
          background = "#F5E0DC";
        };
        normal = {
          black = "#45475A";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
        };
        bright = {
          black = "#585B70";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#A6ADC8";
        };
        dim = {
          black = "#45475A";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
        };
      };
      bell = {
        animation = "EaseOutQuart";
        duration = 100;
        color = "0x404040";
      };
      cursor = {
        style = "Beam";
        unfocused_hollow = true;
        blinking = "Always";
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
      };
      key_bindings = [
        {
          key = "C";
          mods = "Control|Shift";
          action = "Copy";
        }
        {
          key = "V";
          mods = "Control|Shift";
          action = "Paste";
        }
        {
          key = "Up";
          mods = "Control|Shift";
          action = "ScrollPageUp";
        }
        {
          key = "Down";
          mods = "Control|Shift";
          action = "ScrollPageDown";
        }
      ];
    };
  };
}
