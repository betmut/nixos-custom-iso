{config, pkgs, inputs, lib, ... }: {

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    
    #Zsh Shell
    programs.zsh.enable = true;

    #Enable Firefox
    programs.firefox.enable = true;

    #Some programs need SUID wrappers, can be configured further or are
    #started in user sessions.
    #programs.mtr.enable = true;
    #programs.gnupg.agent = {
    #    enable = true;
    #    enableSSHSupport = true;
    #};
   
    #Enable facetimehd
    hardware.facetimehd.enable = true;
    hardware.enableRedistributableFirmware = true;
    
    # Allow proprietary software (Required for Broadcom)
    nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [
            "broadcom-sta-6.30.223.271-59-6.18.13"
        ];
    };

    # Support for Broadcom BCM4360
    boot = {
        initrd.availableKernelModules = ["xhci_pci" "nvme" "usb_storage" "usbhid" "sd_mod"];
        initrd.kernelModules = [ "wl" "i915"];
        kernelModules = [ "wl" "kvm-intel" ];
        extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
    };

    # Networking
    networking.networkmanager.enable = true;
    #networking.firewall = {
    #    enable = false;
    #    allowedTCPPorts =  [];
    #    allowedUDPPorts = [];
    #};
    
    #networking.proxy = {
    #    default = "http://user:password@proxy:port/";
    #    noProxy = "127.0.0.1,localhost,internal.domain";
    #};
        
    services = {
        #thermald
        thermald.enable = true;
        #Enable the OpenSSH Daemon
        openssh.enable = true;
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
