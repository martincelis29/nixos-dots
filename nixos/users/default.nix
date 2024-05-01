{
  config,
  pkgs,
  ...
}: {
  #*--------------------
  #* USER CONFIGURATION
  #*--------------------

  #*--- Martin ---*#
  users.users.martin = {
    isNormalUser = true;
    description = "Martin";
    # TODO: optional if docker.enable ++ docker
    extraGroups = ["wheel" "networkmanager" "video" "audio" "docker"];
  };
}
