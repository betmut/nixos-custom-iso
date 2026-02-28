{config, pkgs,...}:{

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = let 
          theme = "border=magenta;text=cyan;prompt=green;container=black;greet=bright_cyan;time=bright_green";
          greeting = "Welcome back. Ready to dive in?";
        in
        "${pkgs.tuigreet}/bin/tuigreet --time --cmd start-hyprland --theme ${theme} --greeting ${greeting}";
        user = "greeter";
      };
    };
  };
}
