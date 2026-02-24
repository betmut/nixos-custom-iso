{config, pkgs, inputs, modulesPath, ... }: {

  system.stateVersion = "25.11";
  imports = [
    ./modules/common.nix
    ./modules/linux.nix
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
