{config, pkgs, lib,...}: {

  #Hyprpaper config
  services.hyprpaper = {
    enable = true;
    settings = {
    wallpaper = [
        {
          monitor = "eDP-1";
          path = "${../wallpaper/forest_castle.png}";
        }
      ];
    };
  };
}
