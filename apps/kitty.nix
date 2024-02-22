{ config, pkgs, pkgs-unstable, lib, ... }:

{
   programs.kitty = {
     enable = true;
     shellIntegration.enableZshIntegration = true;
     package = pkgs-unstable.kitty;
     theme = "Dark Pastel";
  };
}     
