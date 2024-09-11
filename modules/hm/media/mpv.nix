{ 
  pkgs,
  lib, 
  config,
  ... 
}:

let
  cfg = config.hmModules.mpv;
in
  {
    options.hmModules.mpv = {
      enable = lib.mkEnableOption "mpv";
    };

    config = lib.mkIf cfg.enable {
      home.packages = with pkgs; [ mpv ];
      home.file.".config/mpv/" = { # Will configure MPV in a more Nix way later.
        source = ./mpv;
        force = true;
      };
    };
  }


