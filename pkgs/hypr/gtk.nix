{
  pkgs,
  ... 
}:

{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Vimix-White";
      package = pkgs.vimix-icon-theme.override { colorVariants = [ "White" ]; };
    };
  };
}
