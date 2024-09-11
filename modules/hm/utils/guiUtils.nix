{ 
  pkgs,
  lib, 
  config,
  ... 
}:

let
  cfg = config.hmModules.utils.guiUtils;
in
  {
    options.hmModules.utils.guiUtils = {
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
