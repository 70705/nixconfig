{ 
  pkgs,
  lib,
  config,
  ...
}:

let
  cfg = config.hmModules.lanraragi;
in
  {
    imports = [ ./redis.nix ];
    options.hmModules.lanraragi = {
      enable = lib.mkEnableOption "lanraragi";
    };

  config = lib.mkIf cfg.enable {

    home.packages = with pkgs; [ lanraragi redis ];
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
