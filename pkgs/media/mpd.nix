{
  pkgs-unstable, 
  ... 
}:

{

  services = {
    mpd = {
      enable = true;
      packages = pkgs-unstable.mpd; 
      musicDirectory = /media/gamedisk2/Musicas;
    };
  };
}
