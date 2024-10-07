{
  lib,
  config,
  ...
}:

{
  stylix.targets.hyprpaper.enable = false;
  services.hyprpaper = {
    enable = lib.mkIf config.modules.home.graphical.hypr.enable true;
    settings = {
      preload = [ "/etc/nixos/modules/home/graphical/hypr/wallpaper.png" ];
      wallpaper = [ ",/etc/nixos/modules/home/graphical/hypr/wallpaper.png" ];
    };
  };
}
