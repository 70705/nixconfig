{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.modules.home.utils.gui-tools;
in
{
  options.modules.home.utils.gui-tools = {
    enable = lib.mkEnableOption "gui-tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      keepassxc
      qalculate-qt
      qbittorrent
    ];
  };
}
