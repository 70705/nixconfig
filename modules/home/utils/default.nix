{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./yazi
    ./editors
    ./general
    ./tools
  ];

  home.packages = with pkgs; [
    ouch
    inputs.nix-alien.packages.${pkgs.system}.nix-alien
    nix-prefetch-scripts
    trashy
    btop
    nil
    npins
    python3
    ffmpeg-full
    ffmpegthumbnailer
    #    inputs.nixvim-config.packages.${pkgs.system}.default
  ];
}
