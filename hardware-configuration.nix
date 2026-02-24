{pkgs, inputs, config, lib, ...}:{

  #Timezone
  time.timeZone = "Asia/Jakarta";

  # Keyboard layout
  console = {
    keyMap = "us";
    font = "Lat2-Terminus16";
  };

  # Define Hostname
  networking.hostName = lib.removeSuffix "\n" (builtins.readFile ./hostname/linux);
  services.fstrim.enable = true;

  #Localization
  i18n.defaultLocale = "en_US.UTF-8";

  #Bootloader
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };
  
  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    pulseaudio = {
      enable = true;
      support32Bit = true;    ## If compatibility with 32-bit applications is desired.
    };
  };
}
