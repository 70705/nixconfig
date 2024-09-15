{ pkgs, ... }:

{
  imports = [
    ./picom.nix
    ./i3.nix
    ./polybar.nix
  ];
}
