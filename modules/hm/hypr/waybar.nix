{ 
  lib, 
  config,
  ... 
}:

{
  programs.waybar = {
    enable = lib.mkIf config.hmModules.hypr.enable true; 
    systemd.enable = true;
  };

  home.file.".config/waybar/" = {
    source = ./waybar_config;
    force = true;
  };
}
