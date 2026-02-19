{config, pkgs, lib, inputs, ... }: {

  system.stateVersion = "25.11";
  imports = [
    ./modules/common.nix
    (lib.mkIf pkgs.stdenv.isDarwin (import ./modules/darwin.nix))
    (lib.mkIf pkgs.stdenv.isLinux (import ./modules/linux.nix))
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}