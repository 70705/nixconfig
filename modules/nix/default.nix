{ config, lib, pkgs, ... }:

let
  cfg = config.nixModules;

in
  {
    imports = [
      ./gaming/steam.nix
    ];
  }
