{config, pkgs, inputs, ... }: {
    #Font
    #fonts = {
    #    enableDefaultPackages = true;
    #    packages = with pkgs; [
    #        nerd-fonts.hasklug
    #        ubuntu-classic
    #    ];
    #    fontconfig = {
    #        defaultFonts = {
    #            monospace = ["Hasklug Nerd Font" "Ubuntu Mono"];
    #        };
    #    };
    #};

    #Environment Variables
    environment.variables = {
        EDITOR = "nano";
    };

    # Optional: Add useful tools
    environment.systemPackages = with pkgs; [
        tmux 
        tree
        blueman
        git 
        vim 
        pciutils # Useful for 'lspci'
        neofetch
    ];
}
