{pkgs, ...}: {
  #*------------------------
  #* HYPRLAND CONFIGURATION
  #*------------------------
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
  };

  #*--- ENVIRONMENT VARIABLES ---*#
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1"; # If cursor becomes invisible
    NIXOS_OZONE_WL = "1"; # Hint electron apps to use wayland
  };

  #*--- GVFS CONFIGURATION ---*#
  # Using Nautilus without GNOME, you may need to enable the GVfs service in order for Nautilus to work properly
  services.gvfs.enable = true;

  #*--- POLKIT CONFIGURATION ---*#
  security.polkit.enable = true;
  # Polkit Authentication GNOME as a systemd service
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
    extraConfig = ''
      DefaultTimeoutStopSec=10s
    '';
  };

  #*--- SWAYLOCK ---*#
  # Swaylock cannot unlock with correct password
  security.pam.services.swaylock.text = ''
    # PAM configuration file for the swaylock screen locker. By default, it includes
    # the 'login' configuration file (see /etc/pam.d/login)
    auth include login
  '';
}
