{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./btop
    ./cava
    ./dunst
    #./eww
    ./fzf
    ./git
    ./mpv #TODO
    ./swaylock
    ./wofi
  ];
}
