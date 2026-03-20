{config, pkgs, lib,...}: {

  #Hyprpaper config
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [
        {
          monitor = "eDP-1";
          path = "~/nixos-custom-iso/users/mathewelhans/wallpapers/gruv-wallhaven-m9e9m1.png";
        }
      ];
    };
  };
}