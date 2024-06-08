{ config, lib, pkgs, ... }:

{
  services.xserver = {
     enable = true;
     xkb.layout = "br";
     desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
        };
      };

      displayManager.defaultSession = "xfce";
   };
  
   programs.thunar.enable = lib.mkForce false;


  # Do not ask me why Thunar and Tumbler aren't here. It just doesn't work
   environment.xfce.excludePackages = with pkgs.xfce; [ 
    ristretto 
    xfce4-screenshooter  
    xfce4-terminal
    xfdesktop
   ];       

  services = {
    gvfs.enable = true;
    tumbler.enable = lib.mkForce false;
    gnome.gnome-keyring.enable = true;
  };
}
