{inputs, pkgs, ...}: 
  let
    platformSystem = pkgs.stdenv.hostPlatform.system;
    hyprlandPkgs = inputs.hyprland.packages.${platformSystem};
    pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${platformSystem};  
  in
  {
    #basic apps
    environment.systemPackages = with pkgs; [
      kitty         #terminal
      rofi  #app launcher
      yazi   #file manager
    ];
    programs.hyprland = {
      enable = true;
      package = hyprlandPkgs.hyprland;
      portalPackage = hyprlandPkgs.xdg-desktop-portal-hyprland;
    };
    
    hardware.graphics = {
      package = pkgs-unstable.mesa;
      #enable 32 bit support
      enable32Bit = true;
      package32 = pkgs-unstable.pkgsi686Linux.mesa;
    };
  }
