{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./theme
    ./xdg
  ];
}
