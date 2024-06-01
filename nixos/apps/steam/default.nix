{pkgs, ...}: {
  #*--------------------
  #* STEAM CONFIGURATION
  #*--------------------
  programs.steam = {
    enable = true;
    package = pkgs.steam;
    extest = {enable = true;};
    dedicatedServer = {openFirewall = true;};
    localNetworkGameTransfers = {openFirewall = true;};
    remotePlay = {openFirewall = true;};
  };
}
