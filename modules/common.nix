{config, pkgs, inputs, ... }: {
    #Environment Variables
    environment.variables = {
        EDITOR = "nano";
    };

    # Optional: Add useful tools
    environment.systemPackages = with pkgs; [
        cloudflare-warp
        tmux 
        tree
        blueman
        git 
        vim 
        pciutils # Useful for 'lspci'
        fastfetch
        quickemu
        cron
    ];
}
