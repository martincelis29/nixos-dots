{
  pkgs,
  config,
  lib,
  ...
}: {
  #*---------------------
  #* MYSQL CONFIGURATION
  #*---------------------
  # services.mysql = {
  #   enable = true;
  #   package = pkgs.mariadb;
  #   dataDir = "/var/lib/mysql";
  #   user = "mysql";
  #   group = "mysql";
  # };

  #*--------------------------
  #* POSTGRESQL CONFIGURATION
  #*--------------------------
  # services.postgresql = {
  #   enable = true;
  #   package = pkgs.postgresql_16;
  #   port = 5432;
  #   enableJIT = false;
  # };

  #*-----------------------
  #* MONGODB CONFIGURATION
  #*-----------------------
  # services.mongodb = {
  #   enable = true;
  #   package = pkgs.mongodb;
  #   #   user = "mongodb"; # Account under which MongoDB runs
  #   #   dbpath = "/var/db/mongodb"; # Location where MongoDB stores its files
  # };
}
