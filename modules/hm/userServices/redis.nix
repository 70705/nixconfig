{ 
  pkgs,
  ... 
}:

{
  systemd.user.services.redis-server-lanraragi = {
    Unit = {
      Description = "Lanraragi's Redis server";
    };

    Install = {
      WantedBy = [ "multi-user.target" ];
    };

    Service = {
      ExecStart = "${pkgs.redis}/bin/redis-server";
    };
  };
}
