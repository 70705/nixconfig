{ 
  pkgs, 
  ... 
}:

{
  imports = [
    ./shellsRelated.nix
    ./fish.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    any-nix-shell
  ];
}
