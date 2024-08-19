{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/etc/nixos/modules/hm/hypr/wallpaper.png" ];
      wallpaper = [",/etc/nixos/modules/hm/hypr/wallpaper.png"];
    };
  };
}
