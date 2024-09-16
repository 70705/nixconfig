{ 
  lib, 
  config,
  ... 
}:

{
  services.hyprpaper = {
    enable = lib.mkIf config.hmModules.hypr.enable true; 
    settings = {
      preload = [ "/etc/nixos/modules/hm/hypr/wallpaper.png" ];
      wallpaper = [",/etc/nixos/modules/hm/hypr/wallpaper.png"];
    };
  };
}
