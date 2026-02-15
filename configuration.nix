{config, pkgs, modulesPath, lib, ... }: {
  imports = [ "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix" ];

  #Zsh Shell
  programs.zsh.enable = true;
  users.users.nixos = {
    shell = pkgs.zsh;
    isNormalUser = true;
    };

  #Enable facetimehd
  hardware.facetimehd.enable = true;

  # Allow proprietary software (Required for Broadcom)
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["broadcom-sta-6.30.223.271-59-6.12.69" "broadcom-sta-6.30.223.271-59-6.18.10"];
  };

  # Support for Broadcom BCM4360
  boot.initrd.kernelModules = [ "wl" ];
  boot.kernelModules = [ "wl" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];

  # Networking
  networking.networkmanager.enable = true;
  networking.wireless.enable = lib.mkForce false; # Use NM instead for easier CLI setup

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