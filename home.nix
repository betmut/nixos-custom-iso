{pkgs, ... }: {
  home.stateVersion = "25.11";
  
  #VIM config
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; 
      [
        vim-fugitive
        gruvbox
        vim-airline
        vim-airline-themes
        vim-airline-clock
        nerdtree
        vim-slime
        coc-nvim
        vim-racket
        Vundle-vim

        #coc plugins
        coc-pyright #python lsp
        coc-sh
      ];
    settings = {
      background = "dark";
      expandtab = true;
      number = true;
      shiftwidth = 4;
      tabstop = 4;
      mouse = "v";
    };
    extraConfig = builtins.readFile ./.vimrc;
	};

  #zsh config
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "aussiegeek";
    };
  };
}
