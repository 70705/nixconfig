{
  lib,
  config,
  ...
}: {
  stylix.targets.hyprpaper.enable = false;
  services.hyprpaper = {
    enable = lib.mkIf config.modules.home.wm.hypr.enable true;
    settings = {
      preload = ["/etc/nixos/modules/home/wm/hypr/wallpaper.png"];
      wallpaper = [",/etc/nixos/modules/home/wm/hypr/wallpaper.png"];
    };
  };
}
