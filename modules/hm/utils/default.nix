{ 
  pkgs,
  inputs,
  ... 
}:

{
  imports = [
    ./git.nix
    ./yazi.nix
    ./audiothumbs.nix
    ./syncthing.nix
    ./dependencies.nix
    ./guiUtils.nix
    ./fastfetch.nix
  ];

  home.packages = with pkgs; [
    ouch
    inputs.nix-alien.packages.${pkgs.system}.nix-alien
    trashy
    btop
    nil
    niv
    python3
    ffmpeg-full
    ffmpegthumbnailer
    inputs.nixvim-config.packages.${pkgs.system}.default
  ];
}
