{ ... }:

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

    displayManager = {
      enable = true;
      defaultSession = "none+i3";
      autoLogin.user = "victor";
      autoLogin.enable = true;
    };

  };
}
