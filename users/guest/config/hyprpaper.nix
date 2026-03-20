{config, pkgs, lib,...}: {
  
  #Hyprpaper config
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [
        {
          monitor = "eDP-1";
          path = "${~/nixos-custom-iso/dotfiles/hyprpaper/wallpapers/Kurumi-Ebisuzawa.png}";
        }
      ];
    };
  };
}
