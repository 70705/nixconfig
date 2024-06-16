{ 
  pkgs-unstable, 
  ... 
}:

{

  home.file.".config/starship.toml" = {
    source = ./starship.toml;
    force = true;
   };

   programs = {
     zoxide = {
       enable = true;
       enableFishIntegration = true;
       package = pkgs-unstable.zoxide;
     };

     carapace = {
       enable = true;
       enableFishIntegration = true;
       package = pkgs-unstable.carapace;
     };

   atuin = {
     enable = true;
     package = pkgs-unstable.atuin;
     enableFishIntegration = true;
   };

   eza = {
     enable = true;
     package = pkgs-unstable.eza;
     enableFishIntegration = true;
     git = true;
     icons = true;

     extraOptions = [ 
       "--group-directories-first"
       "--header"
       "--long"
       "--no-permissions"
       "--no-user"
     ];
   };

   yazi = {
     enable = true;
     package = pkgs-unstable.yazi;
     enableFishIntegration = true;
   };

 };
}
