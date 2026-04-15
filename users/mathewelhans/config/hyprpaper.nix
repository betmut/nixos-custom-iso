{config, pkgs, lib,...}: 
  let 
    wallpaper = pkgs.fetchurl {
      url = "https://gruvbox-wallpapers.pages.dev/wallpapers/anime/totoro_bus_stand.png";
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
          path = "${wallpaper}";
        }
      ];
    };
  };
}