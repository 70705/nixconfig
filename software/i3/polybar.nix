{
  pkgs, 
  pkgs-unstable,
  inputs,
  ... 
}:

{
  polybar = {
    enable = true;
    config = /etc/nixos/software/i3/polybar/config.ini;
  };
}
