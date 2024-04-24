{pkgs, ...}: {
  #*------------------------
  #* XMONAD CONFIGURATION
  #*------------------------
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };
}
