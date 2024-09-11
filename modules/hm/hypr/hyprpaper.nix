{ 
  lib, 
  config,
  ... 
}:

let
  cfg = config.hmModules.hypr.hyprpaper;
in
  {
    options.hmModules.hypr.hyprpaper = {
      enable = lib.mkEnableOption "hyprpaper";
    };

    config = lib.mkIf cfg.enable {
      services.hyprpaper = {
        enable = true;
        settings = {
          preload = [ "/etc/nixos/modules/hm/hypr/wallpaper.png" ];
          wallpaper = [",/etc/nixos/modules/hm/hypr/wallpaper.png"];
        };
      };
    };
  }
