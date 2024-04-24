{
  pkgs,
  config,
  lib,
  ...
}: let
  material-icons-and-symbols = pkgs.callPackage ./material-icons-and-symbols {};
  sn-pro = pkgs.callPackage ./sn-pro {};
in {
  #*--------------------
  #* FONT CONFIGURATION
  #*--------------------
  fonts = {
    packages = with pkgs; [
      material-icons-and-symbols
      sn-pro

      noto-fonts
      source-sans
      font-awesome
      office-code-pro
      google-fonts
      (nerdfonts.override {fonts = ["FiraCode" "Ubuntu" "UbuntuMono"];})
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = ["Ubuntu Nerd Font Mono"];
        serif = ["Noto Serif" "Source Han Serif"];
        sansSerif = ["Noto Sans" "Source Han Sans"];
      };
    };
  };
}
