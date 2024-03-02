{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      keeweb = "keeweb --no-sandbox";
      suna = "sudo nano";
      trash = "nix-collect-garbage && sudo nix-collect-garbage && sudo nix-collect-garbage -d";
      rebuild = "sudo nixos-rebuild switch";
     };
    oh-my-zsh = {
     enable = true;
     theme = "Chicago95";
     custom = "/etc/nixos/home/xfce/ohmyzsh";
    };
  };
}

