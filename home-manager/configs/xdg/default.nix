{
  lib,
  config,
  ...
}: {
  #*-------------------
  #* XDG CONFIGURATION
  #*-------------------
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      associations.added = {
        "application/pdf" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "application/json" = ["code.desktop"];
        "application/yaml" = ["code.desktop"];
        "application/javascript" = ["code.desktop"];
        "text/html" = ["code.desktop"];
        "text/css" = ["code.desktop"];
        "image/svg+xml" = ["code.desktop"];
        "image/png" = ["org.gnome.eog.desktop"];
        "image/jpeg" = ["org.gnome.eog.desktop"];
        "image/webp" = ["org.gnome.eog.desktop"];
        "image/gif" = ["org.gnome.eog.desktop"];
        "video/x-matroska" = ["mpv.desktop"];
        "video/mp4" = ["mpv.desktop"];
        "video/avi" = ["mpv.desktop"];
        "video/*" = ["mpv.dekstop"];
        "audio/mpeg" = ["mpv.desktop"];
        "audio/*" = ["mpv.desktop"];
        #"x-scheme-handler/magnet" = [ "deluge.desktop" ];
      };
      defaultApplications = {
        "application/pdf" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "application/json" = ["code.desktop"];
        "application/yaml" = ["code.desktop"];
        "application/javascript" = ["code.desktop"];
        "text/html" = ["code.desktop"];
        "text/css" = ["code.desktop"];
        "image/svg+xml" = ["code.desktop"];
        "image/png" = ["org.gnome.eog.desktop"];
        "image/jpeg" = ["org.gnome.eog.desktop"];
        "image/webp" = ["org.gnome.eog.desktop"];
        "image/gif" = ["org.gnome.eog.desktop"];
        "video/x-matroska" = ["mpv.desktop"];
        "video/mp4" = ["mpv.desktop"];
        "video/avi" = ["mpv.desktop"];
        "video/*" = ["mpv.dekstop"];
        "audio/mpeg" = ["mpv.desktop"];
        "audio/*" = ["mpv.desktop"];
        #"x-scheme-handler/magnet" = [ "deluge.desktop" ];
      };
    };
  };

  home.file.".config/user-dirs.dirs" = {
    text = ''
      # This file is written by xdg-user-dirs-update
      # If you want to change or add directories, just edit the line you're
      # interested in. All local changes will be retained on the next run.
      # Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
      # homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
      # absolute path. No other format is supported.
      #
      XDG_DESKTOP_DIR="$HOME/Desktop"
      XDG_DOWNLOAD_DIR="$HOME/Downloads"
      XDG_TEMPLATES_DIR="$HOME/Templates"
      XDG_PUBLICSHARE_DIR="$HOME/Public"
      XDG_DOCUMENTS_DIR="$HOME/Documents"
      XDG_MUSIC_DIR="$HOME/Music"
      XDG_PICTURES_DIR="$HOME/Pictures"
      XDG_VIDEOS_DIR="$HOME/Videos"
    '';
  };
  home.file.".config/user-dirs.locale" = {
    text = ''
      en_US
    '';
  };
}
