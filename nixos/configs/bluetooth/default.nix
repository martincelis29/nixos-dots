{pkgs, ...}: {
  #*-------------------------
  #* BLUETOOTH CONFIGURATION
  #*-------------------------
  hardware.bluetooth = {
    enable = true;
  };
  services.blueman.enable = true;

  # High quality BT calls
  #hardware.bluetooth = {
  #  enable = true;
  #  package = pkgs.bluez;
  #  hsphfpd.enable = true;
  #};
}
