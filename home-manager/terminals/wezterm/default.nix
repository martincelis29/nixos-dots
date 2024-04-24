{pkgs, ...}: let
  config = builtins.readFile ./config/wezterm.lua;
in {
  #*-----------------------
  #* WEZTERM CONFIGURATION
  #*-----------------------
  programs.wezterm = {
    enable = true;
    package = pkgs.wezterm;
    extraConfig = config;
  };
}
