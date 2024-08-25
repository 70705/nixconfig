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
       enableZshIntegration = true;
       package = pkgs.zoxide;
     };

     starship = {
       enable = true;
       enableTransience = true;
       enableZshIntegration = true;
       package = pkgs.starship;
     };

     carapace = {
       enable = true;
       enableZshIntegration = true;
       package = pkgs.carapace;
     };

     atuin = {
      enable = true;
      enableZshIntegration = true;
      package = pkgs.atuin;
    };

     eza = {
      enable = true;
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
