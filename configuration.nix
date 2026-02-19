{config, pkgs, inputs, ... }: {

  system.stateVersion = "25.11";
  imports = [
    ./modules/common.nix
    (if pkgs.stdenv.isLinux then ./modules/linux.nix else ./modules/darwin.nix)
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}