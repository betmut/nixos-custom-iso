{config, pkgs, lib, inputs, ... }: {

  system.stateVersion = "25.11";
  imports = [
    ./modules/common.nix
    ./modules/darwin.nix
    ./modules/linux.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}