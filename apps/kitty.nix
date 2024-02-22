{ config, pkgs, pkgs-unstable, lib, ... }:

{
   programs.kitty = {
     enable = true;
     extraConfig = builtins.readFile ./kitty.conf;
     shellIntegration.enableZshIntegration = true;
     package = pkgs-unstable.kitty;
     theme = "Dark Pastel";
     keybindings = { "ctrl+shift+left" = "previous_window"; "ctrl+shift+right" = "next_window"; "ctrl+q" = "close_window"; };
     font = {
      name = "Hack";
      package = pkgs.hack-font;
      size = 14;
    };
  };
}     
