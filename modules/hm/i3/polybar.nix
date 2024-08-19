{ 
  pkgs,
  ... 
}:

{
  services.polybar = {
    enable = true;
    config = /etc/nixos/modules/hm/i3/polybar/config.ini;
    script = "polybar-msg cmd quit && polybar bar &";
    package = pkgs.polybarFull; 
  };
}
