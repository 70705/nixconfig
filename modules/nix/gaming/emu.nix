{ 
  lib,
  config,
  pkgs,
  ... 
}:


let
  cfg = config.nixModules.gameEmu;
in
  {
    options.nixModules.gameEmu = {
      enable = lib.mkEnableOption "gameEmu";
    };

    config = lib.mkIf cfg.enable {
      environment.systemPackages = with pkgs; [ 
        (retroarchBare.override {
          cores = with libretro; [
            ppsspp
          ];
        })
        retroarch-assets
      ];
    };
  }
