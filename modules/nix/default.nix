{ config, lib, pkgs, ... }:

let
  cfg = config.nixModules;

in
  {
    imports = [
      ./gaming
      ./system
      ./defaultConfig.nix
    ];
  }
