{
  config,
  pkgs,
  ...
}: {
  #*-------------------
  #* SSH CONFIGURATION
  #*-------------------
  # Enable the OpenSSH daemon.
  # services.openssh = {
  #   enable = true;
  #   openFirewall = true;
  #   settings = {
  #     PasswordAuthentication = false;
  #     PermitRootLogin = "no";
  #   };
  # };
}
