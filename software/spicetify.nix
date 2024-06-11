{ pkgs, lib, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  imports = [ inputs.spicetify-nix.homeManagerModule ];

  # configure spicetify :)
  programs.spicetify =
    {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        shuffle # shuffle+ (special characters are sanitized out of ext names)
        adblock
        history
      ];
    };
}
