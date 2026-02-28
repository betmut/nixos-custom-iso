{config, pkgs,...}:{
  stylix.targets.vscode.enable = false;
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default = {
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = true;
      extensions = with pkgs.vscode-extensions; 
      [
        #syntax-higlighting, lsp
        jeff-hykin.better-nix-syntax
        ecmel.vscode-html-css
        davidanson.vscode-markdownlint
        ms-python.vscode-pylance     

        #colorscheme
        jdinhlife.gruvbox
        vscode-icons-team.vscode-icons
      ]; 
      userSettings = {
        #window
        #"window.autoDetectColorScheme" = false;

        #workbench
        "workbench.startupEditor" = "none";
        "workbench.iconTheme" =  "vscode-icons";
        "workbench.colorTheme" = "Gruvbox Dark Hard";
      
        #editor
        "editor.fontSize" = 14;
        "editor.lineHeight" = 1.4;
        "editor.fontFamily" = "Hasklug Nerd Font";
        "editor.cursorBlinking" = "smooth";
        "editor.cursorStyle" = "line";
        "editor.fontLigatures" =  true; 
        "editor.tabSize" = 2;
      };
    };
  };
}
