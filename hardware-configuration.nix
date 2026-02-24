{pkgs, inputs, config,...}:{
  boot.loader.grub.device = "/dev/sda";
  networking.hostName = nixpkgs.lib.removeSuffix "\n" (builtins.readFile ./hostname/linux);

  services.fstrim.enable = true;
  
  fileSystems."/" = { 
    device = "/dev/sda3";
    # ...
  };

  fileSystems."/boot" = { 
    device = "/dev/sda1";
    # ...
  };
}