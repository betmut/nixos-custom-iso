{pkgs, inputs,...}:{

  imports = [ 
    inputs.stylix.nixosModules.stylix 
    #inputs.stylix.homeModules.stylix 
  ];

  stylix = {
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";
    polarity = "dark";
    image = "./wallpapers/abstract-2_1_1.jpg";
    fonts = {
      serif = {
        package = pkgs.newcomputermodern;
        name = "TeX Gyre Termes";
      };
      
      sansSerif = {
        package = pkgs.ubuntu-sans;
        name = "Ubuntu";
      };
      
      monospace = {
        package = pkgs.nerd-fonts.hasklug;
        name = "Hasklug Nerd Font Mono";
      };
      
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 12; # GUI apps (like Firefox menus, file managers)
        terminal = 14;     # Your terminal emulator (Alacritty, Kitty, etc.)
        desktop = 10;      # Desktop widgets, bars, and notifications
        popups = 10;       # Tooltips and small menus
      };
    };
    opacity.terminal = 0.7;
  };
}
