{config, pkgs, inputs,  ... }: {
    #Zsh Shell
    programs.zsh.enable = true;
   
    #Enable facetimehd
    hardware.facetimehd.enable = true;
    hardware.enableRedistributableFirmware = true;
    
    # Allow proprietary software (Required for Broadcom)
    nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [
            "broadcom-sta-6.30.223.271-59-6.18.12"
        ];
    };

    # Support for Broadcom BCM4360
    boot = {
        initrd.kernelModules = [ "wl" ];
        kernelModules = [ "wl" ];
        extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
    };
    # Networking
    networking.networkmanager.enable = true;
    services = {
        #thermald
        thermald.enable = true;
        #mbpfan -- fan controller daemon for Apple Macs and MacBook
        mbpfan = {
            enable = true;
            aggressive = false;
            settings = {
                general = {
                    low_temp = 63;  # If temperature is below this, fans will run at minimum speed.
                    high_temp = 66; # If temperature is above this, fan speed will gradually increase.
                    max_temp = 86; # If temperature is above this, fans will run at maximum speed.
                };
            };
        };
    };
}