# ==========================================================================================
# ██╗  ██╗ ██████╗ ███╗   ███╗███████╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
# ██║  ██║██╔═══██╗████╗ ████║██╔════╝    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
# ███████║██║   ██║██╔████╔██║█████╗      ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
# ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝      ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
# ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
# ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝
# ==========================================================================================
#*--- IMPORTS AND VARIABLES ---*#
{
  inputs,
  lib,
  config,
  pkgs,
  username,
  ...
}: let
  spotify = pkgs.callPackage ../packages/spotify {};
in {
  imports = [
    ./apps #TODO
    ./browsers
    ./configs
    ./desktops #TODO
    ./dev
    ./editors #TODO
    ./shell
    ./terminals
  ];

  targets.genericLinux.enable = true;

  #*--- NIX CONFIGURATION ---*#
  nixpkgs = {
    overlays = [
      (final: prev: {
        # Fix slack screen sharing following: https://github.com/flathub/com.slack.Slack/issues/101#issuecomment-1807073763
        slack = prev.slack.overrideAttrs (previousAttrs: {
          installPhase =
            previousAttrs.installPhase
            + ''sed -i'.backup' -e 's/,"WebRTCPipeWireCapturer"/,"LebRTCPipeWireCapturer"/' $out/lib/slack/resources/app.asar'';
        });
      })
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  #*--- HOME CONFIGURATION ---*#
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "code";
      TERMINAL = "kitty";
      BROWSER = "firefox";
      NIXPKGS_ALLOW_UNFREE = "1";
      SHELL = "${pkgs.zsh}/bin/zsh";
      T_XCB_GL_INTEGRATION = "none";

      # ANDROID_HOME = "$HOME/Android/Sdk";
      # JAVA_HOME = "${pkgs.jdk}/lib/openjdk";
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.npm-global/bin"
    ];
    stateVersion = "23.05";
  };

  #*--- PACKAGES TO INSTALL IN USER ---*#
  home.packages = with pkgs; [
    # tools
    pamixer
    playerctl
    pavucontrol
    neofetch
    bottom
    #profile-cleaner # Reduces browser profile sizes by cleaning their sqlite databases
    #pandoc # Conversion between markup formats
    distrobox
    #tldr # Manual Pages for Command Line Tools
    gh # GitHub CLI tool
    #nmap # Utility for network discovery and security auditing
    #hashcat # Fast password cracker
    #ffuf # Tool for web fuzzing
    #watchman # Watches files and takes action when they change
    #scrcpy # Display and control Android devices over USB or TCP/IP
    #k6
    nh
    # nikto

    # quickgui
    # quickemu

    # apps
    gnome.nautilus
    gnome.totem
    webcord
    slack
    font-manager
    gnome.gnome-tweaks
    gnome.gnome-disk-utility
    onlyoffice-bin
    #d-spy # D-Bus exploration tool
    icon-library

    # flatpak
    gnome.gnome-software

    # ags
    inputs.ags.packages.${system}.default
  ];

  #*--- HOME-MANAGER ---*#
  programs.home-manager.enable = true;

  #*--- SERVICES ---*#
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
