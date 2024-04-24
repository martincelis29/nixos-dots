{pkgs, ...}: {
  #*----------------------
  #* DOCKER CONFIGURATION
  #*----------------------
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;

    # rootless = {
    #  enable = true;
    #  setSocketVariable = true;
    # };
  };
  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
