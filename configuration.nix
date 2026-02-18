{config, pkgs, lib, ... }: {

  system.stateVersion = "25.11";

  #Zsh Shell
  programs.zsh.enable = true;
  users.users.nixos = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel"];
    initialPassword = "";
    };

  #Enable facetimehd
  hardware.facetimehd.enable = true;
  hardware.enableRedistributableFirmware = true;

  # Allow proprietary software (Required for Broadcom)
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["broadcom-sta-6.30.223.271-59-6.12.69" "broadcom-sta-6.30.223.271-59-6.18.10"];
  };

  # Support for Broadcom BCM4360
  boot = {
    initrd.kernelModules = [ "wl" ];
    kernelModules = [ "wl" ];
    extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  };
  
  # Networking
  networking.networkmanager.enable = true;

  #Font
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.hasklug
      ubuntu-classic
    ];
    
    fontconfig = {
      defaultFonts = {
        monospace = ["Hasklug Nerd Font" "Ubuntu Mono"];
      };
    };
  };

  services = {
    #thermald
    thermald.enable = true;

    #mbpfan -- fan controller daemon for Apple Macs and MacBook
    mbpfan = {
      enable = true;
      aggressive = false;
      settings = {
        options.general = {
          low_temp = 63;  # If temperature is below this, fans will run at minimum speed.
          high_temp = 66; # If temperature is above this, fan speed will gradually increase.
          max_temp = 86; # If temperature is above this, fans will run at maximum speed.
          };
      };
    };
  };
  
  #Environment Variables
  environment.variables = {
    EDITOR = "vim";
  };
  
  # Optional: Add useful tools
  environment.systemPackages = with pkgs; [
    tmux 
    tree
    blueman
    git 
    vim 
    pciutils # Useful for 'lspci'
    neofetch
  ];
}