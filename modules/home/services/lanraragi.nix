{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.modules.home.services.lanraragi;
in
{
  options.modules.home.services.lanraragi = {
    enable = lib.mkEnableOption "lanraragi";
  };

  config = lib.mkIf cfg.enable {

    home.packages = with pkgs; [
      lanraragi
      redis
    ];
    systemd.user.services.lanraragi = {

      Unit = {
        Description = "Lanraragi server";
        Requires = "redis-server-lanraragi.service";
        After = "redis-server-lanraragi.service";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };

      Service = {
        ExecStart = "${pkgs.lanraragi}/bin/lanraragi";
      };
    };

    systemd.user.services.redis-server-lanraragi = {
      Unit = {
        Description = "Lanraragi's Redis server";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };

      Service = {
        ExecStart = "${pkgs.redis}/bin/redis-server";
      };
    };
  };
}
