{
  config,
  pkgs,
  ...
}: {
  #*---------------------
  #* NGINX CONFIGURATION
  #*---------------------
  services.nginx = {
    enable = true;
    enableReload = true;
    package = pkgs.nginxMainline;
    user = "nginx";
    group = "nginx";
    virtualHosts."localhost" = {
      default = true;
    };
  };

  #security.acme.acceptTerms = true;
  #security.acme.defaults.email = email;
  #
  #services.nginx = {
  #  enable = true;
  #
  #  recommendedGzipSettings = true;
  #  recommendedOptimisation = true;
  #  recommendedProxySettings = true;
  #  recommendedTlsSettings = true;
  #
  #  commonHttpConfig = ''
  #    charset utf-8;
  #    source_charset utf-8;
  #  '';
  #
  #  virtualHosts."docs.lcl" = {
  #    root = "/etc/nixos/docs/.vuepress/dist";
  #  };
  #};
  #
  #networking.extraHosts =
  #  ''
  #    127.0.0.1 docs.lcl
  #  '';
}
