{ 
  lib,
  config,
  pkgs,
  ... 
}:


let
  cfg = config.nixModules.gaming.retroarch;
in
  {
    options.nixModules.gaming.retroarch = {
      enable = lib.mkEnableOption "retroarch";
    };

    config = lib.mkIf cfg.enable {
      environment.systemPackages = with pkgs; [ 
        (retroarch.override {
          cores = with libretro; [
            ppsspp
            mame
          ];
        })
        retroarch-assets
      ];
    };
  }
