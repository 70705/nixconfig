{ 
  pkgs, 
  ... 
}:

{
  imports = [
    ./shellsRelated.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    any-nix-shell
  ];
}
