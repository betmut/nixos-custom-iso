{config, pkgs, lib, ... }: {

  imports = [
    ./config/vscode.nix
    ./config/vim.nix
    ./config/hypridle.nix
    ./config/hyprpaper.nix
    ./config/zsh.nix
  ];
  home.stateVersion = "25.11";
  
  #Packages
  home.packages = with pkgs; [
    gnome-font-viewer
    cheese
    vscode
    nodejs 
    python3 
    R 
    gemini-cli 
    htop 
    cmatrix 
    brightnessctl 
    wireplumber
    spotify
    steam
    playerctl
    obsidian
    rstudio
    discord
    zoom-us
    vlc
    eog
    zotero
    zathura
    evince
    mgba
  ];
  home.sessionVariables = {
    GIT_EDITOR = "vim";
    NIXOS_OZONE_WL = "1";
  };

  #.config files
  xdg.configFile = {
    "hypr/hyprland.conf".source = ../../dotfiles/hyprland/hyprland.conf;

    "kitty/kitty.conf".source = ../../dotfiles/kitty/kitty.conf;
    "kitty/gruvbox-kitty.conf".source = ../../dotfiles/kitty/gruvbox-kitty.conf;

    "yazi/theme.toml".source = ../../dotfiles/yazi/theme.toml;
    "yazi/flavors".source  = ../../dotfiles/yazi/flavors;

    "neofetch/config.conf".source = ../../dotfiles/neofetch/config.conf;
  };
  
}
