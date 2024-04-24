{pkgs, ...}: {
  #*-------------------------------
  #* VIRTUAL MACHINE CONFIGURATION
  #*-------------------------------
  home.packages = with pkgs; [
    virt-manager #Desktop user interface for managing virtual machines
  ];
}
