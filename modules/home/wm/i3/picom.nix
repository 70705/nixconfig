{
  lib,
  config,
  ...
}: let
  cfg = config.modules.home.wm.i3.picom;
in {
  options.modules.home.wm.i3.picom = {
    enable = lib.mkEnableOption "picom";
  };

  config = lib.mkIf cfg.enable {
    services.picom = {
      enable = true;
      shadow = true;
      vSync = true;
      extraArgs = ["--unredir-if-possible"];
      backend = "glx";

      activeOpacity = 1;
      inactiveOpacity = 0.85;
      opacityRules = [
        "100:class_g = 'qutebrowser'"
        "100:class_g = 'Image Lounge'"
        "100:class_g = 'Vivaldi-stable'"
        "100:class_g = 'mpv'"
        "100:class_g = 'Chromium-browser'"
        "100:class_g = 'org.wezfurlong.wezterm'"
      ];

      settings = {
        round-borders = 10;
        rounded-corners-exclude = ["class_g = 'Polybar'"];
        corner-radius = 10.0;

        blur = {
          method = "dual_kawase";
          size = 10;
          deviation = 5.0;
        };
      };
    };
  };
}
