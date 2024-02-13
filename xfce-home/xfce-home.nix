{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;
    iconTheme.name = "Chicago95";
    theme.name = "Chicago95";  
  };
  xfconf.settings = {
     xfwm4 = { "general/theme" = "Chicago95";};
     xfwm4 = { "/general/use_compositing" = false;};
 };
}
