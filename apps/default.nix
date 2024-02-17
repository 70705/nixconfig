{ config, pkgs, lib, ... }:

{
  imports = [
    ./spicetify.nix
    ./vscode.nix
    ./vivaldi.nix
    ./git.nix
    ./shells.nix
    ./picom.nix
    ./otherApps.nix
   ];
}
