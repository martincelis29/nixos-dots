{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    #./alacritty
    ./kitty
    ./wezterm
  ];
}
