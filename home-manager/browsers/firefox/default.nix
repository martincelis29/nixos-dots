{
  pkgs,
  username,
  ...
}: let
  userjs = builtins.readFile ./config/user.js;
in {
  #*-----------------------
  #* FIREFOX CONFIGURATION
  #*-----------------------
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles.${username} = {
      id = 0;
      name = "${username}";
      isDefault = true;
      search = {
        default = "DuckDuckGo";
        force = true;
      };
      extraConfig = userjs;
    };
    profiles.default = {
      id = 1;
      name = "default";
      search = {
        default = "DuckDuckGo";
        force = true;
      };
    };
    policies = {
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DisableFeedbackCommands = true;
      DisablePocket = true;
      DisableSetDesktopBackground = true;
      DisableDeveloperTools = false;
      DontCheckDefaultBrowser = true;
      HardwareAcceleration = true;
      Extensions = {
        Install = [
          "https://addons.mozilla.org/firefox/downloads/latest/youtube-addon/latest.xpi" # Improve YouTube! 🎧 (for YouTube & Videos)
          "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi" # Bitwarden - Password Manager
          "https://addons.mozilla.org/firefox/downloads/latest/nighttab/latest.xpi" # nightTab
          "https://addons.mozilla.org/firefox/downloads/latest/simple-tab-groups/latest.xpi" # Simple Tab Groups
          "https://addons.mozilla.org/firefox/downloads/latest/tabcenter-reborn/latest.xpi" # Tab Center Reborn
          "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi" # uBlock Origin
        ];
        Uninstall = [
          "bing@search.mozilla.org"
          "amazondotcom@search.mozilla.org"
          "ebay@search.mozilla.org"
          "twitter@search.mozilla.org"
        ];
      };
    };
  };

  # Firefox Css
  home = {
    file."chrome" = {
      target = ".mozilla/firefox/${username}/chrome";
      source = ./config/chrome;
    };
  };
}
