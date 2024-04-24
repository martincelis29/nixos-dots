{pkgs, ...}: {
  #*-------------------------
  #* WORDPRESS CONFIGURATION
  #*-------------------------
  # services.wordpress = {
  #   webserver = "httpd"; # one of "httpd", "nginx", "caddy"
  #   sites."wordpress" = {
  #     package = pkgs.wordpress;
  #     #settings = {};
  #     #extraConfig = ''''; # Any additional text to be appended to the wp-config.php
  #     virtualHost = {
  #       #addSSL = true; # Whether to enable HTTPS in addition to plain HTTP
  #       #enableACME = true; # Whether to ask Let's Encrypt to sign a certificate for this vhost
  #       #adminAddr = ""; # E-mail address of the server administrator
  #       #extraConfig = ''''; # These lines go to httpd.conf verbatim
  #     };
  #   };
  # };
  networking.extraHosts = ''
    127.0.0.1 wordpress
  '';
}
