{
  pkgs,
  ...
}:

{
  imports = [
    ./shellsRelated.nix
    ./zsh.nix
    ./starship.nix
  ];

  home.packages = with pkgs; [
    any-nix-shell
  ];
}
