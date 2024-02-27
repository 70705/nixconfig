{ config, lib, pkgs, ... }:

{

imports = [
    ./disks.nix
    ./graphics.nix
    ./grub.nix
    ./nix-ld.nix
    ./pipewire.nix
    ./xfce.nix
   ];
}
