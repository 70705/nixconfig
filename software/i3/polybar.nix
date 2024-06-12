{
  pkgs, 
  pkgs-unstable,
  inputs,
  ... 
}:

{
  services.polybar = {
    enable = true;
    config = /etc/nixos/software/i3/polybar/config.ini;
  };
}
