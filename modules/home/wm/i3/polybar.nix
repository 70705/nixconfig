{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.home.wm.i3.polybar;
in {
  options.modules.home.wm.i3.polybar = {
    enable = lib.mkEnableOption "polybar";
  };

  config = lib.mkIf cfg.enable {
    services.polybar = {
      enable = true;
      config = /etc/nixos/modules/home/wm/i3/polybar/config.ini;
      script = "polybar-msg cmd quit && polybar bar &";
      package = pkgs.polybarFull;
    };
  };
}
