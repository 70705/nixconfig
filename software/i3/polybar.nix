{ 
  pkgs,
  ... 
}:

{
  services.polybar = {
    enable = true;
    config = /etc/nixos/software/i3/polybar/config.ini;
    script = "polybar-msg cmd quit && polybar bar &";
    package = pkgs.polybarFull; 
  };
}
