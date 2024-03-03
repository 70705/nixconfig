{ config, pkgs, lib, pkgs-unstable, ... }:

{

  home.file.".config/starship.toml" = {
    source = ./starship.toml;
    force = true;
   };

  programs = {
    zoxide = {
     enable = true;
     enableNushellIntegration = true;
     enableFishIntegration = true;
     package = pkgs-unstable.zoxide;
    };
 
   carapace = {
     enable = true;
     enableFishIntegration = true;
     enableNushellIntegration = true;
     package = pkgs-unstable.carapace;
   };

   starship = {
     enable = false;
     enableFishIntegration = false;
     enableNushellIntegration = false;
     enableZshIntegration = false;
   };

   atuin = {
     enable = true;
     package = pkgs-unstable.atuin;
     enableNushellIntegration = true;
     enableZshIntegration = false;
     enableFishIntegration = true;
   };

   zellij = {
     enable = true;
     settings = {};
     enableFishIntegration = true;

   };

   thefuck = {
     enable = true;
     package = pkgs.thefuck;
     enableFishIntegration = true;
     
   };

 };

}
