{pkgs, ...}: let
  config = builtins.readFile ./config/config;
in {
  #*------------------------
  #* SWAYLOCK CONFIGURATION
  #*------------------------
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };
  home.file.".config/swaylock/config" = {
    text = config;
  };
}
