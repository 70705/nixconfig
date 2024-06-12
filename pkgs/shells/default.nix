{ 
  pkgs, 
  ... 
}:

{
  imports = [
    ./shellsRelated.nix
    ./fish.nix
  ];

  home.packages = with pkgs; [
    any-nix-shell
  ];
}
