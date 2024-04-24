{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  #*-------------------
  #* NIX CONFIGURATION
  #*-------------------
  nix = {
    # This will add each flake input as a registry to make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;
    # This will additionally add your inputs to the system's legacy channels making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    settings = {
      experimental-features = "nix-command flakes"; # Enable flakes and new 'nix' command
      auto-optimise-store = true; # Deduplicate and optimize nix store
      trusted-users = ["root" "@wheel"]; # Give root user and wheel group special Nix privileges.
    };
    # garbage collector
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  documentation = {
    man.enable = true;
    doc.enable = false;
    info.enable = false;
  };
}
