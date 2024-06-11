{ pkgs, lib, ... }:

{
  imports = [
    ./autocomplete.nix
    ./keymappings.nix
    ./options.nix
    ./plugins.nix
  ];
}
