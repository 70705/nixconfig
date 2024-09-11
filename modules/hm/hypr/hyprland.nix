{ 
  pkgs,
  inputs,
  lib, 
  config,
  ... 
}:

let
  cfg = config.hmModules.hypr;
in
  {
    options.hmModules.hypr = {
      enable = lib.mkEnableOption "hypr";
    };

    config = lib.mkIf cfg.enable {
      wayland.windowManager.hyprland = { 
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        systemd.variables = ["--all"];

        plugins = [];
        extraConfig = builtins.readFile ./config_hyprland.conf;
      };

      home.packages = with pkgs; [
        hyprshot
        wofi
        clipse
        wl-clipboard
      ];
    };
  }
