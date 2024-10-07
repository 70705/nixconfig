{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.modules.system.gaming.retroarch;
in
{
  options.modules.system.gaming.retroarch = {
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
