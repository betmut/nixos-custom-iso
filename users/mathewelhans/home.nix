{config, pkgs, lib, ... }: {

  imports = [
    ./config/vscode.nix
    ./config/vim.nix
    ./config/hyprland.nix
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
    figma-linux
    vlc
    eog
    zotero
    zathura
    evince
  ];
  home.sessionVariables = {
    GIT_EDITOR = "vim";
    NIXOS_OZONE_WL = "1";
  };

}
