{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.modules.system.wm.i3;
in {
  options.modules.system.wm.i3 = {
    enable = lib.mkEnableOption "i3";
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;
      xkb.layout = "br";
      excludePackages = with pkgs; [xterm];
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

        sddm = {
          enable = true;
          autoNumlock = true;
        };
      };
    };
  };
}
