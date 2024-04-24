{
  config,
  pkgs,
  ...
}: {
  #*--------------------
  #* USER CONFIGURATION
  #*--------------------
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.martin = {
    isNormalUser = true;
    description = "Martin";
    # TODO: optional if docker.enable ++ docker
    extraGroups = ["wheel" "networkmanager" "video" "audio" "docker" "82"];
  };

  # Add completion for system packages
  environment.pathsToLink = ["/share/zsh"];
}
