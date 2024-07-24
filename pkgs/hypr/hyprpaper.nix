{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/etc/nixos/pkgs/hypr/wallpaper.png" ];
      wallpaper = [",/etc/nixos/pkgs/hypr/wallpaper.png"];
    };
  };
}
