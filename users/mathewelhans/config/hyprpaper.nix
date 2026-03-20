{config, pkgs, lib,...}: 
  let 
    wallhavenWallpaper = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/AngelJumbo/gruvbox-wallpapers/refs/heads/main/wallpapers/anime/gruv-wallhaven-m9e9m1.png";
      sha256 = "sha256-v9P4EO3gM39F5YI2o4wK+ZKYAtDC4/9Zo16GrQWct78=";
    };
  in {
  #Hyprpaper config
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [
        {
          monitor = "eDP-1";
          path = "${wallhavenWallpaper}";
        }
      ];
    };
  };
}