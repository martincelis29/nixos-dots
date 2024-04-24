{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./db
    ./docker
    #./moodle
    #./nginx
    ./wordpress
  ];
}
