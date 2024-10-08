{
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.modules.home.userServices.lanraragi;
in
{
  imports = [ ./redis.nix ];
  options.modules.home.userServices.lanraragi = {
    enable = lib.mkEnableOption "lanraragi";
  };

  config = lib.mkIf cfg.enable {

    home.packages = with pkgs; [
      lanraragi
      redis
    ];
    systemd.user.services.lanraragi = {

      Unit = {
        Description = "Lanraragi  server";
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
  };
}
