{ ... }:

{

  imports = [
    ../../modules/home
  ];

  modules.home = {
    browser.firefox.enable = false;
    userServices.lanraragi.enable = false;
    hypr.enable = false;

    media = {
      spotify.enable = false;
      mpv.enable = false;
    };

    utils = {
      syncthing.enable = false;
      yazi.enable = false;
      guiUtils.enable = false;
    };

    i3 = {
      enable = false;
      polybar.enable = false;
      picom.enable = false;
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
