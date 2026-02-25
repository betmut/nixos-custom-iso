{pkgs, inputs,...}:{

  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";
    polarity = "dark";
    #image = "";
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
    };
    #stylix.targets.vscode.enable = false;
    opacity.terminal = 0.7;
  };
}
