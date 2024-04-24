{pkgs, ...}: {
  #*-----------------------
  #* FLATPAK CONFIGURATION
  #*-----------------------
  services.flatpak = {
    enable = true;
  };
  #For sandboxed apps to work correctly, desktop integration portals need to be installed. Eg.
  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
