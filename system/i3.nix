{ config, lib, pkgs, ... }:

{

  services.xserver = {
     enable = true;
     xkb.layout = "br";
     desktopManager = {
        xterm.enable = false;
      };

      displayManager.lightdm.enable = true;
      windowManager.i3 = {
        enable = true;
        configFile = ./i3config/config-i3;
        extraPackages = [ pkgs.autotiling pkgs.setroot pkgs.rofi ];
     };
   };

  services = {
    libinput = {
      enable = true;

      # disabling mouse acceleration
      mouse = {
        accelProfile = "flat";
      };

      touchpad = {
        accelProfile = "flat";
      };
    };

    gvfs.enable = true;
    tumbler.enable = lib.mkForce false;
    gnome.gnome-keyring.enable = true;
    displayManager.enable = true;
    displayManager.defaultSession = "none+i3";
    displayManager.autoLogin.user = "victor";
    displayManager.autoLogin.enable = true;
  };
}
