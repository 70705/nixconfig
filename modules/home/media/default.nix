{ 
  pkgs,
  ... 
}:

{
  imports = [
    ./mpv.nix
    ./spicetify.nix
  ];
  home.packages = with pkgs; [

    stremio
    pavucontrol
    alsa-utils
 #   inputs.audiorelay.packages.${pkgs.system}.audio-relay
    playerctl
    nomacs
    pinta
  ];
}
