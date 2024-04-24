{pkgs, ...}: {
  #*------------------------
  #* DATABASE CONFIGURATION
  #*------------------------
  home.packages = with pkgs; [
    #dbeaver
    #mycli
    #pgcli
    #sqlite

    #*--- MONGODB ---*#
    mongosh
    mongodb-compass
  ];
}
