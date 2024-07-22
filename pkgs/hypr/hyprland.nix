{
  inputs,
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    plugins = [];
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [",/etc/nixos/pkgs/hypr/wallpaper.png"];
    };
  };

  services.mako = {
    enable = true;
  };

  home.packages = with pkgs; [
    hyprshot
  ];
}