{
  config,
  pkgs,
  ...
}: {
  #*----------------------
  #* NEOVIM CONFIGURATION
  #*----------------------
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  xdg.desktopEntries.nvim = {
    name = "Neovim";
    noDisplay = true;
  };
}
