{pkgs, ...}: {
  #*------------------------
  #* PRINTING CONFIGURATION
  #*------------------------
  # Enable CUPS to print documents.
  services.printing = {
    enable = false;
  };
}
