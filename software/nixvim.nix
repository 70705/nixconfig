{ pkgs, lib, ... }:

{
  imports = [
    ./autocomplete.nix
    ./keymappings.nix
    ./options.nix
    ./plugins.nix
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim.enable = true;

}
