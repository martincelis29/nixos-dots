{
  pkgs,
  config,
  lib,
  ...
}: {
  #*----------------------
  #* MOODLE CONFIGURATION
  #*----------------------
  services.moodle = {
    enable = true;
    package = pkgs.moodle;
    virtualHost = {
      hostName = "moodle";
      #addSSL = true; # Whether to enable HTTPS in addition to plain HTTP
      #enableACME = true; # Whether to ask Let's Encrypt to sign a certificate for this vhost
    };
    database = {
      name = "moodle";
      type = "mysql";
    };
    initialPassword = "admin";
    # Efficient delivery of static or large files
    # extraConfig = ''
    #   $CFG->xsendfile = 'X-Accel-Redirect';
    #   $CFG->xsendfilealiases = array(
    #     '/dataroot/' => $CFG->dataroot
    #   );
    # '';
  };

  #*--- NGINX CONFIGURATION ---*#
  # services.nginx = {
  #   enable = true;
  #   virtualHosts."moodle" = {
  #     #forceSSL = true;
  #     #enableACME = true;
  #     root = "${config.services.moodle.package}/share/moodle";
  #     locations = {
  #       "/" = {
  #         index = "index.php index.html index.htm";
  #         tryFiles = "$uri $uri/ /index.php";
  #       };
  #       "~ [^/]\\.php(/|$)" = {
  #         root = "${config.services.moodle.package}/share/moodle";
  #         extraConfig = ''
  #           fastcgi_index            index.php;
  #           fastcgi_param   SCRIPT_FILENAME $document_root$fastcgi_script_name;
  #           fastcgi_pass             unix:${config.services.phpfpm.pools.moodle.socket};
  #           include ${config.services.nginx.package}/conf/fastcgi_params;
  #           include ${config.services.nginx.package}/conf/fastcgi.conf;
  #         '';
  #       };
  #       "/how-to/" = {
  #         alias = "/var/lib/moodle/how-to/";
  #         index = "index.html index.mp4";
  #       };
  #       "/infoabend/" = {
  #         alias = "/var/lib/moodle/infoabend/";
  #         index = "index.html index.mp4";
  #       };
  #       "/dataroot/" = {
  #         alias = "/var/lib/moodle/";
  #         extraConfig = ''
  #           internal;
  #         '';
  #       };
  #     };
  #   };
  # };

  #*--- PHP-FPM CONFIGURATION ---*#
  # services.phpfpm = {
  #   pools.moodle = {
  #     user = lib.mkForce "moodle";
  #     settings."security.limit_extensions" = ".php";
  #   };
  #   phpOptions = ''
  #     upload_max_filesize = 8192M
  #     post_max_size = 9000M
  #   '';
  # };

  #*--- MYSQL CONFIGURATION ---*#
  # services.mysql = {
  #   enable = true;
  #   ensureDatabases = [config.services.moodle.database.name];
  #   ensureUsers = [
  #     {
  #       name = "moodle";
  #       ensurePermissions = {
  #         "${config.services.moodle.database.name}.*" = "SELECT, INSERT, UPDATE, DELETE, CREATE, CREATE TEMPORARY TABLES, DROP, INDEX, ALTER";
  #       };
  #     }
  #   ];
  #   settings = {
  #     mysqld = {
  #       # fix moodle bug: https://tracker.moodle.org/browse/MDL-72131
  #       innodb_read_only_compressed = false;
  #     };
  #   };
  # };

  #*--- LOCAL DOMAIN CONFIGURATION ---*#
  networking.extraHosts = ''
    127.0.0.1 moodle
  '';

  #*--- DISABLE HTTPD ---*#
  # services.httpd = {
  #   enable = lib.mkOverride 25 false;
  #   user = lib.mkForce config.services.nginx.user;
  #   group = config.services.nginx.group;
  # };
}
