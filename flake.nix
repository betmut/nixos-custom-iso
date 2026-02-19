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

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }: 
  let
    # Run scutil --get LocalHostName > ./hostname/mac to get your Mac Hostname (Please double check it!)
    macHostname = nixpkgs.lib.removeSuffix "\n" (builtins.readFile ./hostname/mac);
    linuxHostname = nixpkgs.lib.removeSuffix "\n" (builtins.readFile ./hostname/linux);

    sharedModules = user: [
      ./configuration.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          extraSpecialArgs = { inherit inputs; };
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${user} = ./home.nix;
          };
      }
    ];
  in
  {
    packages.x86_64-linux.minimal-iso = inputs.nixos-generators.nixosGenerate {
      system = "x86_64-linux";
      format = "install-iso";
      modules = sharedModules "nixos";
    };

    packages.x86_64-linux.vbox = inputs.nixos-generators.nixosGenerate {
      system = "x86_64-linux";
      format = "virtualbox";
      modules = (sharedModules "nixos") ++ [
        ({pkgs, ...}:{virtualisation.virtualbox.guest.enable = true;})
      ];
    };

    nixosConfigurations.${linuxHostname} = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = sharedModules "nixos";
    };

    darwinConfigurations.${macHostname} = inputs.nix-darwin.lib.darwinSystem {
      modules = (sharedModules "macUser") ++ [
        ({pkgs, config,  ...}: {
          # Optional: Align homebrew taps config with nix-homebrew
          homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
          nixpkgs.hostPlatform = "x86_64-darwin";
        })
        inputs.nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            enableRosetta = true;

            # User owning the Homebrew prefix
            user = "macUser";

            # Optional: Declarative tap management
            taps = {
              "homebrew/homebrew-core" = inputs.homebrew-core;
              "homebrew/homebrew-cask" = inputs.homebrew-cask;
            };

            # Optional: Enable fully-declarative tap management
            #
            # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
            mutableTaps = false;
          };
        }
      ];
    };
  };
}