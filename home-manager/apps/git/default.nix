{pkgs, ...}: {
  #*-------------------
  #* GIT CONFIGURATION
  #*-------------------
  programs.git = {
    enable = true;
    package = pkgs.git;
    userEmail = "martincelis29@gmail.com";
    userName = "Martin Celis";
    extraConfig = {
      init.defaultBranch = "main";
      push.default = "current";
      pull.default = "current";
      credential.helper = "cache --timeout=10800";
      color.ui = true;
      pull.rebase = false;
    };
  };
}
