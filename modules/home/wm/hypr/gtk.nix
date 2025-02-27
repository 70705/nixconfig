{
  pkgs,
  lib,
  ...
}: {
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = lib.mkForce "prefer-dark";
    };
    "org/gnome/desktop/background" = {
      picture-uri-dark = lib.mkForce "file:///${./wallpaper.png}";
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Vimix-White";
      package = pkgs.vimix-icon-theme;
    };
  };
}
