{config, pkgs, inputs, ... }: {

  system.stateVersion = "25.11";
  imports = [
    ./modules/common.nix
    ./modules/linux_dummy.nix
    ./modules/darwin_dummy.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}