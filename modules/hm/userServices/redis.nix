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
      WantedBy = [ "default.target" ];
    };

    Service = {
      ExecStart = "${pkgs.redis}/bin/redis-server";
    };
  };
}
