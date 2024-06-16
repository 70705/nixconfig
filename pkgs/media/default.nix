{ 
  pkgs,
  inputs,
  ... 
}:

{
  imports = [
    ./mpv.nix
    ./spicetify.nix
    ./gallery-dl.nix
    ./mpd.nix
    ./ncmpcpp.nix
  ];
  home.packages = with pkgs; [

    stremio
    mpv
    pavucontrol
    alsa-utils
    inputs.audiorelay.packages.${pkgs.system}.audio-relay
    playerctl
    nomacs
    pinta
    strawberry-qt6

  ];
}
