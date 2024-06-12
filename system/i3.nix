{ 
  pkgs, 
  ... 
}:

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
#        configFile = ./i3config/config-i3;
 #       extraPackages = [ pkgs.autotiling pkgs.setroot pkgs.rofi ];
     };
   };

  services = {
    libinput = {
      enable = true;

      mouse = {
        accelProfile = "flat";
      };

      touchpad = {
        accelProfile = "flat";
      };
    };

    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;

    displayManager = {
      enable = true;
 #     defaultSession = "none+i3";
      autoLogin.user = "victor";
#      autoLogin.enable = true;
    };

  };
}
