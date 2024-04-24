{
  config,
  pkgs,
  ...
}: {
  #*---------------------
  #* EMACS CONFIGURATION
  #*---------------------
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    #extraPackages = epkgs: [epkgs.vterm];
    #extraConfig = '''';
  };

  xdg.desktopEntries.emacsclient = {
    name = "Emacs (Client)";
    noDisplay = true;
  };
}
