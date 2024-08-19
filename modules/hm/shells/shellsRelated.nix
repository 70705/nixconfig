{ 
  pkgs, 
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
       enableFishIntegration = false;
       enableZshIntegration = true;
       package = pkgs.zoxide;
     };

     starship = {
       enable = true;
       enableTransience = true;
       enableFishIntegration = false;
       enableZshIntegration = true;
       package = pkgs.starship;
     };

     carapace = {
       enable = true;
       enableFishIntegration = false;
       enableZshIntegration = true;
       package = pkgs.carapace;
     };

     atuin = {
      enable = true;
      enableFishIntegration = false;
      enableZshIntegration = true;
      package = pkgs.atuin;
    };

     eza = {
      enable = true;
      enableFishIntegration = false;
      enableZshIntegration = true;
      package = pkgs.eza;
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
 };
}
