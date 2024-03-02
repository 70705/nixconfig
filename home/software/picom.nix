{ config, pkgs, lib, ... }:

{

  services.picom = {
    enable = true;
    shadow = false;
    vSync = true;
    extraArgs = [ "--unredir-if-possible" ];
    backend = "glx";
  };

}
