{inputs, pkgs, ...}: 
  let
    platformSystem = pkgs.stdenv.hostPlatform.system;
    hyprlandPkgs = inputs.hyprland.packages.${platformSystem};
    pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${platformSystem};  
  in
  {
    programs.hyprland = {
      enable = true;
      package = hyprlandPkgs.hyprland;
      portalPackage = hyprlandPkgs.xdg-desktop-portal-hyprland;
    };

    #basic apps
    environment.systemPackages = with pkgs; [
      kitty                       #terminal
      rofi                        #app launcher
      thunar
      yazi                        #file manager
      hyprpaper                   #wallpaper daemon
      hypridle
      hyprlock
      waybar                      #status bars
      swaynotificationcenter      #notification bars

      #screenshot tools
      grim
      slurp
      swappy
      wf-recorder

      gapless #music
    ];

    environment.etc = {
      #waybar config
      "xdg/waybar/config".source = ../dotfiles/waybar/gruvbox/config;
      "xdg/waybar/style.css".source = ../dotfiles/waybar/gruvbox/style.css;
      
      #swayNC config 
      "xdg/swaync/config.json".source = ../dotfiles/swaync/config.json;
      "xdg/swaync/style.css".source = ../dotfiles/swaync/style.css;
    };

    hardware.graphics = {
      package = pkgs-unstable.mesa;
      #enable 32 bit support
      enable32Bit = true;
      package32 = pkgs-unstable.pkgsi686Linux.mesa;
    };
  }
