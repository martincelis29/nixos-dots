{
  config,
  pkgs,
  lib,
  ...
}: {
  #*-------------------
  #* EWW CONFIGURATION
  #*-------------------
  programs.eww = {
    enable = true;
    package = pkgs.eww-wayland;
    configDir = ./config;
  };
}
