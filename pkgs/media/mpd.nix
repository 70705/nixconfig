{
  pkgs-unstable, 
  ... 
}:

{

  services = {
    mpd = {
      enable = true;
      package = pkgs-unstable.mpd; 
      musicDirectory = /media/gamedisk2/Musicas;
      dataDir = /etc/nixos/pkgs/media/mpdData;
      extraConfig = ''
        audio_output {
          type    "pipewire"
          name    "MPD PipeWire Output"
        }
      '';
    };

    mpdris2 = {
      enable = true;
    };
  };
}
