{config, pkgs, lib,...}: {

  #Hyprpaper config
  services.hyprpaper = {
    enable = true;
    settings = {
    wallpaper = [
        {
          monitor = "eDP-1";
          path = "${../wallpapers/cabin.png}";
        }
      ];
    };
  };
}