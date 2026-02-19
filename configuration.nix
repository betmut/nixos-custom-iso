{config, pkgs, inputs, ... }: {

  system.stateVersion = "25.11";
  imports = [
    ./modules/common.nix
    ./modules/linux.nix
    ./modules/darwin.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}