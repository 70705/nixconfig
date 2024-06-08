{ config, pkgs, lib, ... }:

{

  home.file.".config/pcmanfm/default/pcmanfm.conf" = {
    source = ./pcmanfm.conf;
    force = true;
   };

  home.file.".themes" = {
    source = ./themes;
   };

  home.file.".icons" = {
    source = ./icons;
   };

  home.file.".local/share/fonts" = {
    source = ./fonts;
   };

  gtk = {
    enable = true;
#    iconTheme.name = "Chicago95-tux";
    theme.name = "TokyoNight";  
  };

}
