{ config, pkgs, inputs, lib, ... }: {
  # Wrap the configuration to ensure it only evaluates on macOS
  config = lib.mkIf pkgs.stdenv.isDarwin {
    nixpkgs.hostPlatform = "x86_64-darwin"; 

    homebrew = {
        enable = true;
        # Sync taps with nix-homebrew if you use it
        taps = builtins.attrNames config.nix-homebrew.taps or []; 
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
  };
}