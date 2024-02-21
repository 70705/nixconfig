{ config, pkgs, lib, ... }:

{

  home.file.".config/xfce4/xfconf/xfce-perchannel-xml/thunar.xml" = {
    source = ./xfconf/thunar.xml;
    force = true;
   };

  home.file.".config/pcmanfm/default/pcmanfm.conf" = {
    source = ./pcmanfm.conf;
    force = true;
   };

  home.file.".config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml" = {
    source = ./xfconf/xfce4-keyboard-shortcuts.xml;
    force = true;
   };

  home.file.".config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml" = {
    source = ./xfconf/xfce4-panel.xml;
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
    iconTheme.name = "Chicago95-tux";
    theme.name = "Chicago95";  
  };

  xfconf.settings = {

     xfce4-desktop = { "backdrop/screen0/monitorHDMI-0/workspace0/last-image" = "/etc/nixos/xfce-home/wallpaper.png";};
     
     xfwm4 = { 
       "general/theme" = "Chicago95";
       "general/use_compositing" = false;
       "general/workspace_count" = "1";
     };

     xsettings = { 
       "Xft/HintStyle" = "hintfull";
       "Xft/RGBA" = "RGB";
       "Xft/Antialias" = "1";
       "Xft/Hinting" = "1";
       "Gtk/FontName" = "Helvetica 8";
       "Gtk/CursorThemeName" = "Chicago95 Standard Cursors";
     };
  };
}
