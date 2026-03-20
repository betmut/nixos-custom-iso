{config, pkgs, lib,...}: {

  #Hyprpaper config
  services.hyprpaper = {
    enable = true;
    splash = false;
    settings = {
    wallpaper = [
        {
          monitor = "eDP-1";
          path = "${../wallpaper/Kurumi-Ebisuzawa.png}";
        }
      ];
    };
  };
}
