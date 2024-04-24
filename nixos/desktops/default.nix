{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hyprland
    # ./awesome #TODO
    # ./xmonad #TODO
    # ./qtile #TODO
    # ./dwm #TODO
  ];
}
