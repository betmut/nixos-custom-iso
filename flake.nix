{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable"; 
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }: 
  let
    sharedModules = [
      ./configuration.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.nixos = ./home.nix;
          };
      }
    ];
  in
  {
    packages.x86_64-linux.iso = inputs.nixos-generators.nixosGenerate {
      system = "x86_64-linux";
      format = "install-iso";
      modules = sharedModules;
    };

    packages.x86_64-linux.vbox = inputs.nixos-generators.nixosGenerate {
      system = "x86_64-linux";
      format = "virtualbox";
      modules = sharedModules ++ [
        ({pkgs, ...}:{virtualisation.virtualbox.guest.enable = true;})
      ];
    };

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = sharedModules;
    };
  };
}
