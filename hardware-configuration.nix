{pkgs, inputs, config, lib, ...}:{

  # Keyboard layout
  services.xserver.xkb.layout = "us";

  # Define Hostname
  networking.hostName = lib.removeSuffix "\n" (builtins.readFile ./hostname/linux);

  boot.loader.grub.device = "/dev/sda";
  services.fstrim.enable = true;
  
  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/<uuid>";
    fsType = "ext4";
    option = ["noatime" "nodiratime"];
    # ..2.
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-uuid/<uuid>";
    fsType = "vfat"
    # ...
  };
}