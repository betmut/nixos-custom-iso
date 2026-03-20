{config, pkgs, lib,...}: 
  let 
    kurumiWallpaper = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/AngelJumbo/gruvbox-wallpapers/refs/heads/main/wallpapers/anime/Kurumi-Ebisuzawa.png";
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
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
          path = "${kurumiWallpaper}";
        }
      ];
    };
  };
}
