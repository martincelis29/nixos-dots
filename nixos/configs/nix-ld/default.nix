{
  lib,
  config,
  pkgs,
  ...
}: {
  #*--- NIX-LD CONFIGURATION ---*#
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # alsa-lib
      # at-spi2-atk
      # at-spi2-core
      # atk
      # cairo
      # cups
      # curl
      # dbus
      # expat
      # fontconfig
      # freetype
      # fuse3
      # ffmpeg
      # gdk-pixbuf
      # glib
      # gtk3
      # gst_all_1.gstreamer
      # harfbuzz
      # icu
      # icu66
      # icu70
      # lcms
      # libGL
      # libappindicator-gtk3
      # libdrm
      # libepoxy
      # libevent
      # libglvnd
      # libnotify
      # libpulseaudio
      # libopus
      # libunwind
      # libusb1
      # libuuid
      # libsoup
      # libsoup_3
      # libwpe
      # libwpe-fdo
      # libxkbcommon
      # libvpx
      # libvpx_1_8
      # libxml2
      # libxslt
      # mesa
      # nspr
      # nss
      # openssl
      # openh264
      # pango
      # pipewire
      # stdenv.cc.cc
      # systemd
      # sqlite
      # vulkan-loader
      # webkitgtk_4_1
      # woff2
      # xorg.libX11
      # xorg.libXScrnSaver
      # xorg.libXcomposite
      # xorg.libXcursor
      # xorg.libXdamage
      # xorg.libXext
      # xorg.libXfixes
      # xorg.libXi
      # xorg.libXrandr
      # xorg.libXrender
      # xorg.libXtst
      # xorg.libxcb
      # xorg.libxkbfile
      # xorg.libxshmfence
      # zlib
    ];
  };
}
