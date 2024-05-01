{pkgs, ...}: let
  hyprland = builtins.readFile ./config/hyprland.conf;
  pyprland = builtins.readFile ./plugins/pyprland/pyprland.toml;
in {
  #*------------------------
  #* HYPRLAND CONFIGURATION
  #*------------------------
  home.file.".config/hypr/hyprland.conf" = {
    text = hyprland;
  };

  #*--- PACKAGES ---*#
  home.packages = with pkgs; [
    wayland
    swww
    wofi
    swayidle
    wl-clipboard
    wl-screenrec
    gnome.zenity
    xdg-utils
    polkit_gnome
    libnotify
    networkmanagerapplet
    hyprpicker
    grim
    slurp
    gnome.eog
    imagemagick
    wlsunset

    pkgs.pyprland
    # plugins.pyprland
  ];

  #*--- SCRIPTS ---*#
  home.file."scripts" = {
    target = ".config/hypr/scripts";
    source = ./config/scripts;
  };

  #*--- PLUGINS ---*#
  # nixpkgs.overlays = [
  #   (final: prev: {
  #     plugins = {
  #       pyprland = pkgs.callPackage ./plugins/pyprland {};
  #     };
  #   })
  # ];
  home.file.".config/hypr/pyprland.toml" = {
    text = pyprland;
  };
}
