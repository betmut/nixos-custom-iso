{ config, pkgs, lib, inputs, ... }: 
{
  # Wrap everything in 'config' to satisfy the module system
  config = lib.mkMerge [
    # 1. High-level settings (No mkIf wrapper here to avoid recursion)
    {
      nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "broadcom-sta-6.30.223.271-59-6.18.12"
        ];
      };
    }

    # 2. Platform-specific settings (Wrapped in mkIf)
    (lib.mkIf pkgs.stdenv.isLinux {
      programs.zsh.enable = true;
      
      users.users.nixos = {
          shell = pkgs.zsh;
          isNormalUser = true;
          extraGroups = ["wheel"];
          initialPassword = "";
      };
      
      hardware.facetimehd.enable = true;
      hardware.enableRedistributableFirmware = true;

      boot = {
          initrd.kernelModules = [ "wl" ];
          kernelModules = [ "wl" ];
          extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
      };
      
      networking.networkmanager.enable = true;
      
      services = {
          thermald.enable = true;
          mbpfan = {
              enable = true;
              settings.general = {
                  low_temp = 63;
                  high_temp = 66;
                  max_temp = 86;
              };
          };
      };
    })
  ];
}