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
  services.fstrim.enable = true; #Enable TRIM
  services.printing.enable = true; #Enable CUPS to print documents.
  services.libinput.enable = true; #Enable touchpad support

  #Enable X11 window server
  #services.xserver = {
  #  enable = true;
  #  #Configure keymap in X11
  #  xkb = {
  #      layout = "us";
  #      options = "eurosign:e,caps:escape";
  #  };
  #};

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
