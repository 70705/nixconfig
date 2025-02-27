{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.home.utils.syncthing;
in {
  options.modules.home.utils.syncthing = {
    enable = lib.mkEnableOption "syncthing";
  };

  config = lib.mkIf cfg.enable {
    systemd.user.services = {
      syncthingtray = {
        Service.ExecStart = lib.mkForce "${pkgs.syncthingtray-minimal}/bin/syncthingtray --wait";
        Unit.After = lib.mkForce ["graphical-session.target"];
      };

      syncthing.Unit.After = lib.mkForce ["graphical-session.target"];
    };

    services = {
      syncthing = {
        enable = true;
        tray.enable = true;
      };
    };
  };
}
