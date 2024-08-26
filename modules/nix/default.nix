{ config, lib, pkgs, ... }:

let
  cfg = config.nixModules;

in
  {
    imports = [
      ./gaming
      ./gaming/emu.nix
      ./system
      ./defaultConfig.nix
    ];
  }
