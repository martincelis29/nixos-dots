{pkgs, ...}: let
  hyprland-conf = builtins.readFile ./config/hyprland.conf;
  pyprland-conf = builtins.readFile ./plugins/pyprland/pyprland.toml;
  # pyprland = pkgs.callPackage ../../../packages/pyprland {};
in {
  #*------------------------
  #* HYPRLAND CONFIGURATION
  #*------------------------
  home.file.".config/hypr/hyprland.conf" = {
    text = hyprland-conf;
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
    xorg.xhost

    pkgs.pyprland
  ];

  #*--- SCRIPTS ---*#
  home.file."scripts" = {
    target = ".config/hypr/scripts";
    source = ./config/scripts;
  };

  #*--- PLUGINS ---*#
  home.file.".config/hypr/pyprland.toml" = {
    text = pyprland-conf;
  };
}
