{ 
  pkgs, 
  inputs, 
  ... 
}:
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];
  programs.spicetify =
   let
     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
   in
   {
     enable = true;
     enabledExtensions = with spicePkgs.extensions; [
       fullAppDisplay
       shuffle # shuffle+ (special characters are sanitized out of ext names)
       adblock
       hidePodcasts
       history
     ];
     theme = spicePkgs.themes.catppuccin;
     colorScheme = "mocha";
   };
}
