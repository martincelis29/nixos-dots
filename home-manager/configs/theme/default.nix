{pkgs, ...}: let
  rose-pine-gtk = pkgs.callPackage ../../../packages/rose-pine {};
  cssContent = builtins.readFile ./rose-pine/gtk-4.0/gtk.css;
in {
  #*---------------------
  #* THEME CONFIGURATION
  #*---------------------
  # nixpkgs.overlays = [
  #   (final: prev: {
  #     gtk-theme = {
  #       rose-pine-gtk = callPackage ./rose-pine {};
  #     };
  #   })
  # ];

  gtk = {
    enable = true;
    theme = {
      name = "RosePine-Main-BL";
      package = rose-pine-gtk;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4 = {
      extraCss = cssContent;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {
        color = "violet";
      };
    };
    cursorTheme = {
      name = "capitaine-cursors";
      package = pkgs.capitaine-cursors;
      size = 24;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "gtk2";
    };
  };

  home = {
    sessionVariables = {
      XCURSOR_THEME = "capitaine-cursors";
      XCURSOR_SIZE = "24";
      GTK_THEME = "RosePine-Main-BL";
      QT_QPA_PLATFORMTHEME = "gtk2";
    };
    packages = with pkgs; [
      libsForQt5.qtstyleplugins
    ];
  };

  home.file.".config/kdeglobals" = {
    text = ''
      [Colors:View]
      BackgroundNormal= #262339
    '';
  };
}
