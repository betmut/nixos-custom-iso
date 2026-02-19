{config, pkgs, lib, inputs, lib, ... }: lib.mkIf pkgs.stdenv.isDarwin {
    
    homebrew = {
        enable = true;
        casks = [
            "racket"
            "qutebrowser"
            "obsidian"
            "whatsapp"
            "gimp"
            "inkscape"
            "figma"
            "minecraft"
            "spotify"
            "capcut"
            "discord"
            "vlc"
            "warzone-2100"
            "virtualbox"
        ];
    };   
}