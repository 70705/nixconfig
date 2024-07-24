{ ... }:

{

  programs.waybar = {
    enable = true;
  };

  home.file.".config/waybar/" = {
    source = ./waybar_config;
    force = true;
  };

}
