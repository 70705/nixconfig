{
  pkgs,
  ...
}:

{
  imports = [
    ./tools
    ./shells
  ];

  home.packages = with pkgs; [
    any-nix-shell
  ];
}
