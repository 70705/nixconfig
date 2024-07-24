{
  inputs,
  pkgs,
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    systemd.variables = ["--all"];

    plugins = [];
    extraConfig = builtins.readFile ./config_hyprland.conf;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/etc/nixos/pkgs/hypr/wallpaper.png" ];
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
