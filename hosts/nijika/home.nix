{...}: {
  imports = [
    ../../modules/home
  ];

  modules.home = {
    browser.firefox.enable = true;

    services = {
      lanraragi.enable = false;
      seanime.enable = true;
    };

    wm = {
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
      gui-tools.enable = true;
      discord.enable = true;
    };
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
