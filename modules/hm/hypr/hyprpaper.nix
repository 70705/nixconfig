{
  pkgs,
  inputs,
  ...
}:

{
  services.hyprpaper = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper;
    settings = {
      preload = [ "/etc/nixos/modules/hm/hypr/wallpaper.png" ];
      wallpaper = [",/etc/nixos/modules/hm/hypr/wallpaper.png"];
    };
  };
}
