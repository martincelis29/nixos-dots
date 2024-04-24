{pkgs, ...}: let
  gitAddCommitPush = pkgs.writeShellScript "gacp" ''
    git add .
    git commit -m "sync $(date '+%d-%m-%Y %H:%M')"
    git push
  '';
in {
  #*-------------------
  #* ZSH CONFIGURATION
  #*-------------------
  programs.zsh = {
    enable = true;
    package = pkgs.zsh;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "command-not-found"
      ];
    };
    initExtra = ''
      autoload -Uz compinit
      compinit
      autoload -U bashcompinit && bashcompinit
      zstyle ':completion:*' menu select
    '';
    shellAliases = {
      "home" = "cd ~";
      ".." = "cd ..";
      "cd.." = "cd ..";
      "..." = "cd ../..";
      "cls" = "clear";
      "ls" = "eza --long --icons always --group-directories-first --smart-group";
      "ll" = "eza --long --icons always --group-directories-first --smart-group --group --all";
      "lt" = "tree --dirsfirst";
      "f" = "fd . -c always | grep --color=auto";
      "mktar" = "tar -cvf";
      "mkbz2" = "tar -cvjf";
      "mkgz" = "tar -cvzf";
      "untar" = "tar -xvf";
      "unbz2" = "tar -xvjf";
      "ungz" = "tar -xvzf";
      "grep" = "grep --color";
      "ip" = "ip --color";
      "py" = "python";
      # "update-home" = "home-manager switch --flake ~/NixOS/#martin";
      # "update-system" = "sudo nixos-rebuild switch --flake ~/NixOS/#Martin-Nixos";
      "update-home" = "${pkgs.nh}/bin/nh home switch --ask $HOME/NixOS";
      "update-system" = "${pkgs.nh}/bin/nh os switch --ask $HOME/NixOS";
      "update-flake" = "sudo nix flake update ~/NixOS";
      "mongo-start" = "docker container start mongo";
      "mongo-stop" = "docker container stop mongo";
      "gacp" = "${gitAddCommitPush}";
    };
  };
}
