{ 
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [ yams ];

  systemd.user.services.yams = {
    Unit = {
      Description = "Yet Another MPD Scrobbler (For Last.FM)";
      Requires = "mpd.service";
    };
    Service = {
      ExecStart = "${pkgs.yams}/bin/yams -d -N";
      Environment = "NON_INTERACTIVE=1";
      Restart = "always";
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };
}
