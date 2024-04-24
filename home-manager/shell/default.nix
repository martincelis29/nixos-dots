{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./starship
    ./tmux
    ./zsh
  ];
}
