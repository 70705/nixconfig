{ ... }:

{

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  home.file.".config/waybar/" = {
    source = ./waybar_config;
    force = true;
  };

}
