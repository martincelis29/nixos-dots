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
    allowedTCPPorts = [
      #   # # Nginx
      #   # 80
      #   # 443
      5173
      4321
    ];
    # allowedUDPPorts = [
    # ];

    #allowedUDPPortRanges = [
    #  { from = 4000; to = 4007; }
    #];
  };
}
