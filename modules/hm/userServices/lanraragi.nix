{ 
  pkgs,
  ... 
}:

{
  systemd.user.services.lanraragi = {
    Unit = {
      Description = "Lanraragi  server";
      Requires = "redis-server-lanraragi.service";
      After = "redis-server-lanraragi.service";
    };

    Install = {
      WantedBy = [ "multi-user.target" ];
    };

    Service = {
      ExecStart = "${pkgs.lanraragi}/bin/lanraragi";
    };
  };
}
