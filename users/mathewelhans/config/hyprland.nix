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

  services.hypridle = {
  enable = true;
  settings = {
    general = {
      lock_cmd = "pidof hyprlock || hyprlock"; # avoids starting multiple instances
      before_sleep_cmd = "loginctl lock-session";    # lock before suspend
      after_sleep_cmd = "hyprctl dispatch dpms on";  # turn on screen after wake
    };

    listener = [
      {
        timeout = 300; # 5 minutes
        on-timeout = "brightnessctl -s set 10"; # Dim the screen
        on-resume = "brightnessctl -r";         # Restore brightness
      }
      {
        timeout = 600; # 10 minutes
        on-timeout = "systemctl suspend"; # Go to sleep
      }
    ];
  };
};

  wayland.windowManager.hyprland.settings = {
    enable = true;

    "$mainMod" = "SUPER";

    "$terminal" = "kitty";
    "$fileManager" = "yazi";
    "$menu" = "rofi -show drun";

    exec-once = [
      "hyprpaper"
      "waybar"
    ];

    bind = [
      "$mainMod, return, exec, $terminal"
      "$mainMod SHIFT, Q, killactive"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, D, exec, $menu"

      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"


      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"
    ];
  };
}