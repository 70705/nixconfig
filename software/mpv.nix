{ config, pkgs, lib, ... }:

{

  home.file.".config/mpv/" = {
    source = ./mpv;
    force = true;
  };
}
