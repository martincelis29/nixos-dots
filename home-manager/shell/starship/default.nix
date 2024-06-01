{
  pkgs,
  lib,
  ...
}: let
  lang = icon: color: {
    symbol = icon;
    format = "[$symbol ](fg:${color})";
  };
  os = icon: bg: fg: "[${icon}](bg:${bg} fg:${fg})";
in {
  #*------------------------
  #* STARSHIP CONFIGURATION
  #*------------------------
  programs.starship = {
    enable = true;
    package = pkgs.starship;
    settings = {
      add_newline = true;
      format = lib.strings.concatStrings [
        #"[╭](bold #F5C2E7)"
        "[](#3B4252)"
        "$os"
        #"$username"
        "[](bg:#434C5E fg:#3B4252)"
        "$directory"
        "[ ](fg:#434C5E)"
        "$git_branch"
        "$git_status"
        "$c"
        "$golang"
        "$haskell"
        "$java"
        "$lua"
        "$nodejs"
        "$perl"
        "$php"
        "$python"
        "$rlang"
        "$ruby"
        "$rust"
        "$container"
        "$docker_context"
        "$kubernetes"
        "$nix_shell"
        "$cmd_duration"
        "$status"
        "\n$character"
      ];
      os = {
        disabled = false;
        format = "$symbol";
      };
      os.symbols = {
        Alpine = os "" "#3B4252" "#0D597F";
        Arch = os "" "#3B4252" "#0F94D2";
        Artix = os "" "#3B4252" "#0F94D2";
        Debian = os "" "#3B4252" "#A80030";
        EndeavourOS = os "" "#3B4252" "#7E3EBE";
        Fedora = os "" "#3B4252" "#3A65A4";
        Gentoo = os "󰣨" "#3B4252" "#BDB9DA";
        Macos = os "" "#3B4252" "#BEC8E8";
        Manjaro = os "" "#3B4252" "#35BFA4";
        NixOS = os "" "#3B4252" "#7EB4DF";
        openSUSE = os "" "#3B4252" "#73BA25";
        SUSE = os "" "#3B4252" "#73BA25";
        Ubuntu = os "" "#3B4252" "#E95420";
      };
      # username = {
      #   show_always = true;
      #   style_user = "bg:#3B4252";
      #   style_root = "bg:#3B4252";
      #   format = "[ $user ]($style)";
      # };
      directory = {
        format = "[ $path ]($style)";
        style = "bg:#434C5E";
        truncation_length = 6;
        truncation_symbol = "~/󰇘/";
      };
      directory.substitutions = {
        "Documents" = "";
        "Downloads" = "";
        "Music" = "";
        "Pictures" = "";
        "Videos" = "";
        "Projects" = "󱌢";
        "School" = "󰑴";
        "GitHub" = "";
        ".config" = "";
      };
      git_branch = {
        symbol = "";
        format = "[$symbol $branch ](fg:purple)($remote_branch )";
      };
      c = lang "" "#6496CE";
      golang = lang "" "#68D3DF";
      haskell = lang "" "#D47BEB";
      java = lang "" "#E06B00";
      lua = lang "" "#01007F";
      nodejs = lang "" "#FBD554";
      perl = lang "" "#0192BB";
      php = lang "" "#8790BA";
      python = lang "" "#F9CB3E";
      rlang = lang "" "#2265B8";
      ruby = lang "" "#F3645C";
      rust = lang "" "#EE7C00";

      container = {
        symbol = "󰏖";
        style = "fg:gray";
        format = "[[](fg:#4F367A)[$symbol](bg:#4F367A fg:#CEB188)[](fg:#4F367A) ]($style)";
      };
      docker_context = {
        symbol = "";
        style = "fg:gray";
        format = "[[](fg:#4F367A)[$symbol $context](bg:#4F367A fg:#1D63ED)[](fg:#4F367A) ]($style) $path";
      };
      kubernetes = {
        symbol = "󱃾";
        style = "fg:gray";
        format = "[[](fg:#4F367A)[$symbol](bg:#4F367A fg:#3B9AD4)[](fg:#4F367A) ($context) ]($style)";
      };
      nix_shell = {
        disabled = false;
        symbol = "";
        style = "fg:gray";
        format = "[[](fg:#4F367A)[$symbol](bg:#4F367A fg:#80BAE0)[](fg:#4F367A) $state ]($style)";
      };
      # time = {
      #   disabled = false;
      #   time_format = "%I:%M"; # Hour:Minute Format
      #   style = "bg:#694AA1";
      #   format = "[ $time ]($style)";
      # };
      cmd_duration = {
        min_time = 1000;
        format = "[ $duration ](fg:yellow)";
      };
      status = {
        symbol = "✗";
        not_found_symbol = "󰍉 Not Found";
        not_executable_symbol = " Can't Execute E";
        sigint_symbol = "󰂭 ";
        signal_symbol = "󱑽 ";
        success_symbol = "";
        format = "[ $symbol ](fg:red)";
        map_symbol = true;
        disabled = false;
      };
      character = {
        success_symbol = "[ ╰─](bold #F5C2E7)";
        error_symbol = "[ ╰─](bold #F38BA8)";
      };
    };
  };
}
