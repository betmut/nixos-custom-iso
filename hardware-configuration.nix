{pkgs, inputs, config,...}:{
  boot.loader.grub.device = "/dev/sda";
  
  fileSystems."/" = { 
    device = "/dev/sda3";
    # ...
  };

  fileSystems."/boot" = { 
    device = "/dev/sda1";
    # ...
  };
}