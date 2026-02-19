{config, pkgs, inputs, lib, ... }: {
    nixpkgs.hostPlatform = "x86_64-darwin"; #aarch64-darwin for Apple Silicon

    # Optional: Align homebrew taps config with nix-homebrew
    homebrew.taps = builtins.attrNames config.inputs.nix-homebrew.taps;
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