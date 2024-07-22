{
  pkgs,
  ...
}:

{
  home.file.".config/waybar/" = {
    source = ./waybar_config;
    force = true;
  };

  home.packages = with pkgs; [
    waybar
  ];

}
