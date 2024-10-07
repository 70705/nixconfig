{ 
  pkgs,
  lib, 
  config,
  ... 
}:

let
  cfg = config.modules.home.utils.guiUtils;
in
  {
    options.modules.home.utils.guiUtils = {
      enable = lib.mkEnableOption "guiUtils";
    };

    config = lib.mkIf cfg.enable {
      home.packages = with pkgs; [
        keepassxc
        qalculate-qt
        anki-bin
        pcmanfm
        qbittorrent
      ];
    };
  }
