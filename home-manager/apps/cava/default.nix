{
  config,
  pkgs,
  lib,
  ...
}: let
  config = builtins.readFile ./config/config;
in {
  #*--------------------
  #* CAVA CONFIGURATION
  #*--------------------
  home.packages = with pkgs; [
    cava #Console-based Audio Visualizer for Alsa
  ];
  home.file.".config/cava/config" = {
    text = config;
  };
}
