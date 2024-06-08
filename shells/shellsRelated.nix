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

   atuin = {
     enable = true;
     package = pkgs-unstable.atuin;
     enableNushellIntegration = true;
     enableZshIntegration = false;
     enableFishIntegration = true;
   };

 };

}
