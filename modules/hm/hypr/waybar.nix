{ 
  lib, 
  config,
  ... 
}:

let
  cfg = config.hmModules.hypr.waybar;
in
  {
    options.hmModules.hypr.waybar = {
      enable = lib.mkEnableOption "waybar";
    };

    config = lib.mkIf cfg.enable {
      programs.waybar = {
        enable = true;
        systemd.enable = true;
      };

      home.file.".config/waybar/" = {
        source = ./waybar_config;
        force = true;
      };
    };
  }
