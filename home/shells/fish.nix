{ config, pkgs, lib, pkgs-unstable, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellAliases = {
      keeweb = "keeweb --no-sandbox";
      suna = "sudo nano";
      n-rebuild = "sudo nixos-rebuild switch";
      n-trash = "nix-collect-garbage && sudo nix-collect-garbage && sudo nix-collect-garbage -d";
      };
    };
}


