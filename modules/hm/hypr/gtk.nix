{
  pkgs,
  lib,
  ... 
}:

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = lib.mkForce "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Vimix-White";
      package = pkgs.vimix-icon-theme.override { colorVariants = [ "White" ]; };
    };
  };
}
