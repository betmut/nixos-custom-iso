{pkgs, lib, ... }: {

  imports = [
    ./config/vim.nix
    ./config/zsh.nix
    ./config/hypridle.nix
    ./config/hyprpaper.nix

  ];
  home.stateVersion = "25.11";
  
  #Packages
  home.packages = with pkgs; [nodejs python3 R gemini-cli htop cmatrix];
  home.sessionVariables = {
    GIT_EDITOR = "vim";
  };

  #.config files
  xdg.configFile = {
    "hypr/hyprland.conf".source = ../../dotfiles/hyprland/hyprland.conf;

    "kitty/kitty.conf".source = ../../dotfiles/kitty/kitty.conf;
    "kitty/gruvbox-kitty.conf".source = ../../dotfiles/kitty/gruvbox-kitty.conf;

    "yazi/theme.toml".source = ../../dotfiles/yazi/theme.toml;
    "yazi/flavors".source  = ../../dotfiles/yazi/flavors;
};
}
