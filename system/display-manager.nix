{ ... }:

{
 
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
      sddm = {
        enable = true;
        autoNumlock = true;
        wayland.enable = true;
      };
      enable = true;
      defaultSession = "hyprland";
      autoLogin.user = "victor";
      autoLogin.enable = true;
    };
  };
}
