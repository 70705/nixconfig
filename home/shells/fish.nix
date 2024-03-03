{ config, pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;
    package = pkgs.fish;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      set pure_symbol_prompt '$'
      set pure_enable_single_line_prompt true
    
      any-nix-shell fish --info-right | source
    '';
    plugins = [ { name = "pure";
                src = pkgs.fetchFromGitHub { owner = "pure-fish"; repo = "pure";
                rev = "28447d2e7a4edf3c954003eda929cde31d3621d2"; sha256 = "sha256-8zxqPU9N5XGbKc0b3bZYkQ3yH64qcbakMsHIpHZSne4="; };
 } ]; 
    shellAliases = {
      keeweb = "keeweb --no-sandbox";
      suna = "sudo nano";
      n-rebuild = "sudo nixos-rebuild switch";
      n-trash = "nix-collect-garbage && sudo nix-collect-garbage && sudo nix-collect-garbage -d";
      };
    };
}
