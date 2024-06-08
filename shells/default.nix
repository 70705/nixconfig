{ config, pkgs, lib, ... }:

{
  imports = [
    ./shellsRelated.nix
    ./fish.nix
  ];
}