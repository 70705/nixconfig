{ config, pkgs, lib, ... }:

{
  imports = [
    ./rnnoise.nix
    ./spicetify.nix
    ./vscode.nix
    ./vivaldi.nix
    ./git.nix
    ./shells.nix
    ./picom.nix
    ./otherApps.nix
    ./kitty.nix
   ];
}
