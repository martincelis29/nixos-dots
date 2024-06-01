{
  config,
  pkgs,
  ...
}: {
  #*------------------------
  #* FIREWALL CONFIGURATION
  #*------------------------
  networking.firewall = {
    enable = true;
    # allowedTCPPorts = [
    # Web Server
    # 80
    # 443
    # ];
    # allowedUDPPorts = [
    # ];

    #allowedUDPPortRanges = [
    #  { from = 4000; to = 4007; }
    #];
  };
}
