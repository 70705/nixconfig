{
  config,
  definedVars,
  ...
}:

{

  imports = [
    ../../modules/home
  ];

  home = {
    username = definedVars.username;
    homeDirectory = "/home/${definedVars.username}";
    sessionVariables = {
      EDITOR = ''emacsclient -r --alternate-editor=""'';
      NIXOS_OZONE_WL = "1";
      TERM =
        if config.modules.home.graphical.hypr.enable then
          "foot"
        else if config.modules.home.graphical.i3.enable then
          "kitty"
        else
          null;
    };
  };

  modules.home = {
    browser.firefox.enable = true;
    userServices.lanraragi.enable = true;
    graphical = {
      hypr.enable = true;

      i3 = {
        enable = false;
        polybar.enable = false;
        picom.enable = false;
      };
    };

    media = {
      spotify.enable = true;
      mpv.enable = true;
    };

    utils = {
      syncthing.enable = true;
      yazi.enable = true;
      guiUtils.enable = true;
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

  nixpkgs.config = {
    allowUnfree = true;
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
