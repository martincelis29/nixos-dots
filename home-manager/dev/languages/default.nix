{pkgs, ...}: {
  #*-------------------------
  #* LANGUAGES CONFIGURATION
  #*-------------------------
  home.packages = with pkgs; [
    #*--- C/C++ ---*#
    gcc #GNU Compiler Collection
    cmake
    gnumake
    #glib #C library of programming buildings blocks
    #glibc

    #*--- Go ---*#
    #go
    #gopls #Go LSP

    #*--- Lua ---*#
    lua
    #selene #Lua linter written in rust
    #lua-language-server #Lua LSP

    #*--- Nix ---*#
    nil #Language server for Nix
    alejandra #Nix Code Formatter
    nix-prefetch-git #Script used to obtain source hashes for fetchgit

    #*--- NodeJS ---*#
    nodejs_20
    sassc
    #bun
    #hugo

    #*--- PHP ---*#
    php

    #*--- Python ---*#
    (python311.withPackages (ps:
      with ps; [
        pip
        pipx

        #python-pam
        #pytube
        dbus-python
        #pygobject3 #Python bindings for Glib
        #gst-python #Python bindings for GStreamer
        #xlib
        #glib
        #black #Python formatter
        #flake8 #Linter for Python
        #matplotlib
      ]))
    #conda #package manager for Python
    #poetry #Python dependency management and packaging made easy

    #*--- Ruby ---*#
    #ruby

    #*--- Rust ---*#
    #rustc #Compiler for rust
    #cargo #Downloads your Rust project's dependencies and builds your project
    #lldb #A next-generation high-performance debugger
    #rustfmt #Formatter for rust language
    #rust-analyzer #Rust LSP
    #rustup #The Rust toolchain installer

    #*--- Java ---*#
    # jdk
    # android-studio
    android-tools
  ];
}
