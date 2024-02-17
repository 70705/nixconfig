{ config, pkgs, lib, ... }:

{
  imports = [
    ./desktop-entries.nix
    ./misc-symlinks.nix
   ];
}
