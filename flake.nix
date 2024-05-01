{
  description = "NixOS and Home-Manager flake";

  inputs = {
    # NixPkgs Unstable
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Aylur's Gtk Shell
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    username = "martin";
    host = "Nixos";
    system = "x86_64-linux";
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake ~/NixOS/#Martin-Nixos'
    nixosConfigurations = {
      Martin-Nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        # Main NixOS configuration file
        modules = [
          ./nixos/configuration.nix
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake ~/NixOS/#martin'
    homeConfigurations = {
      "${username}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {inherit inputs username;};
        # Main home-manager configuration file
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
  };
}
