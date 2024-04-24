{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./brave
    ./firefox
  ];
}
