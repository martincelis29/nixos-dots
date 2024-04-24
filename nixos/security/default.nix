{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./firewall
    ./gpg
    ./ssh
  ];
}
