# ============================================================================================
# ███╗   ██╗██╗██╗  ██╗ ██████╗ ███████╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
# ████╗  ██║██║╚██╗██╔╝██╔═══██╗██╔════╝    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
# ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║███████╗    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
# ██║╚██╗██║██║ ██╔██╗ ██║   ██║╚════██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
# ██║ ╚████║██║██╔╝ ██╗╚██████╔╝███████║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
# ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝
# ============================================================================================
#*--- IMPORTS AND VARIABLES ---*#
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./configs
    ./desktops #TODO
    ./dev
    ./security
    ./services
    ./users #TODO
  ];

  #*--- KERNEL CONFIGURATION ---*#
  boot.kernelPackages = pkgs.linuxPackages_latest;

  #*--- BOOTLOADER CONFIGURATIONS ---*#
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
      timeout = 2;
    };
    supportedFilesystems = [
      "ext4"
      "btrfs"
      "ntfs"
      "fat"
      #"vfat"
      "exfat"
      #"xfs"
      #"zfs"
      #"cifs"
    ];
    tmp.cleanOnBoot = true; # clean /tmp on boot because I fill it with random crap
  };

  #*--- PIPEWIRE CONFIGURATION ---*#
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  security.rtkit.enable = true;
  sound.enable = false; # only meant for ALSA-based configurations
  hardware.pulseaudio.enable = false;
  hardware.enableAllFirmware = true;

  #*--- HARDWARE CONFIGURATION ---*#
  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        intel-ocl
        intel-media-driver #LIBVA_DRIVER_NAME=iHD
      ];
    };
  };
  services.xserver.videoDrivers = ["modesetting"];
  environment.variables = {
    LIBVA_DRIVER_NAME = "iHD";
    VDPAU_DRIVER = "va_gl";
  };

  #*--- X11 CONFIGURATION ---*#
  services.xserver = {
    enable = true; # Enable the X11 windowing system.
    exportConfiguration = true; # Whether to symlink the X server configuration under /etc/X11/xorg.conf
    excludePackages = [pkgs.xterm];
  };

  #*--- DISPLAY MANAGER CONFIGURATION ---*#
  services.xserver.displayManager.lightdm = {
    enable = true;
  };

  #*--- NETWORK CONFIGURATION ---*#
  networking = {
    hostName = "Martin-Nixos"; # Hostname. # NotYourPC
    networkmanager.enable = true; # Enable networking
    # wireless.enable = true; # Enables wireless support via wpa_supplicant.
    # Configure network proxy if necessary
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };
  };

  #*--- KEYBOARD CONFIGURATIONS ---*#
  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "latam";
      variant = "";
    };
  };

  #*--- TIMEZONE AND LOCATION ---*#
  time.timeZone = "America/Santiago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  #*--- ALLOW INSTALL UNFREE PACKAGES ---*#
  nixpkgs.config.allowUnfree = true;

  #*--- PACKAGES TO INSTALL IN SYSTEM ---*#
  environment.systemPackages = with pkgs; [
    # tools
    git
    socat
    dbus
    wget
    alsa-utils
    pulseaudio #pactl and pacmd

    # utils
    jq
    ripgrep
    fd
    lsd
    eza
    tree
    ffmpeg
    bat
    bc

    # home-manager
    home-manager
  ];

  #*--- PORTAL CONFIGURATION ---*#
  xdg.portal = {
    enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  #*--- DBUS CONFIGURATION ---*#
  services.dbus = {
    enable = true;
    packages = [pkgs.dconf];
  };

  #*--- DCONF CONFIGURATION ---*#
  programs.dconf = {
    enable = true;
  };

  #*--- NixOS VERSION ---*#
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
