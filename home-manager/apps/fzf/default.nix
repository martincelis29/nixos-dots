{pkgs, ...}: {
  #*-------------------
  #* FZF CONFIGURATION
  #*-------------------
  programs.fzf = {
    enable = true;
    package = pkgs.fzf;
    defaultOptions = [
      "--border"
      "--info=right"
      "--pointer=◆"
    ];
    colors = {
      "bg+" = "black";
      hl = "cyan";
      "hl+" = "cyan";
      info = "yellow";
      marker = "green";
      prompt = "red";
      spinner = "magenta";
      pointer = "magenta";
      header = "cyan";
      border = "black";
    };

    # FZF_CTRL_T_OPTS
    fileWidgetOptions = [
      "--preview '${pkgs.bat}/bin/bat --number --color=always --line-range :500 {}'"
    ];

    # FZF_ALT_C_OPTS
    changeDirWidgetOptions = [
      "--preview '${pkgs.eza}/bin/eza --tree --color=always {} | head -200'"
    ];
  };
}
