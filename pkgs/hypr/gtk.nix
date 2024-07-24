{
  pkgs,
  ... 
}:

{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Vimix White dark";
      package = pkgs.vimix-icon-theme.override { colorVariants = "White"; };
    };
  };
}
