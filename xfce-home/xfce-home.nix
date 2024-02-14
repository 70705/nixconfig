{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;
    iconTheme.name = "Chicago95";
    theme.name = "Chicago95 Tux";  
  };

  xfconf.settings = {

     xfce4-desktop = { "backdrop/screen0/monitorHDMI-0/workspace0/last-image" = "/etc/nixos/xfce-home/wallpaper.png";};
     
     xfwm4 = { 
       "general/theme" = "Chicago95";
       "general/use_compositing" = false;
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
