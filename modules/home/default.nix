{
  sysVar,
  config,
  ...
}:

{
  imports = [
    ./browsers
    ./media
    ./cli
    ./terminal
    ./utils
    ./services
    ./wm
  ];

  home = {
    username = sysVar.username;
    homeDirectory = "/home/${sysVar.username}";
    sessionVariables = {
      EDITOR = ''emacsclient -r --alternate-editor=""'';
      NIXOS_OZONE_WL = if config.modules.home.wm.hypr.enable then "1" else "0";
      TERM =
        if config.modules.home.wm.hypr.enable then
          "foot"
        else if config.modules.home.wm.i3.enable then
          "kitty"
        else
          null;
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "text/html" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "application/pdf" = "firefox.desktop";
      "inode/directory" = [ "yazi.desktop" ];
      "x-scheme-handler/trash" = "pcmanfm.desktop";
      "image/webp" = "org.nomacs.ImageLounge.desktop";
      "image/png" = "org.nomacs.ImageLounge.desktop";
      "image/jpeg" = "org.nomacs.ImageLounge.desktop";
      "image/jpg" = "org.nomacs.ImageLounge.desktop";
      "image/gif" = "org.nomacs.ImageLounge.desktop";
      #      "application/zip" = ["xarchiver.desktop"];
    };
  };
}
