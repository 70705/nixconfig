{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:

let
  cfg = config.modules.home.media.spotify;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];
  options.modules.home.media.spotify = {
    enable = lib.mkEnableOption "spotify";
  };

  config = lib.mkIf cfg.enable {
    programs.spicetify =
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
      in
      {
        enable = true;
        spicetifyPackage = pkgs.spicetify-cli;
        spotifyPackage = pkgs.spotify;
        enabledExtensions = with spicePkgs.extensions; [
          shuffle
          adblock
          hidePodcasts
          history
        ];
      };
  };
}
