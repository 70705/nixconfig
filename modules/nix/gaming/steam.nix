{ 
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.nixModules.gaming;
in
  {
    options.nixModules.gaming = {
      enable = lib.mkEnableOption "gaming";
    };

    config = lib.mkIf cfg.enable {
      programs = {
        steam = {
          enable = true;
          remotePlay.openFirewall = true;
      };
    };
  };
}
