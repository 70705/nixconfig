{
  pkgs,
  ...
}:

{
  imports = [
    ./shellsRelated.nix
    ./zsh.nix
    ./fish.nix
    ./starship.nix
  ];

  home.packages = with pkgs; [
    any-nix-shell
  ];
}
