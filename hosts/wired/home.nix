{
  config,
  definedVars,
  ... 
}:

{
  
  imports = [ 
    ../../modules/hm
  ];

  home = {
     username = definedVars.username;
     homeDirectory = "/home/${definedVars.username}";
     sessionVariables = { 
       EDITOR = "nvim";  
       TERM = if config.hmModules.hypr.enable then "foot"
          else if config.hmModules.i3.enable then "kitty"
          else null;
        };
      };

   hmModules = {
     browser.firefox.enable = true;
     userServices.lanraragi.enable = true;
     hypr.enable = true;

     media = {
       spotify.enable = true;
       mpv.enable = true;
     };

     utils = {
       syncthing.enable = true;
       yazi.enable = true;
       guiUtils.enable = true;
     };

     i3 = {
       enable = false;
       polybar.enable = false;
       picom.enable = false;
     };
   };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/https"= "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "text/html" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "application/pdf" = "firefox.desktop";
      "inode/directory" = ["yazi.desktop"];
      "x-scheme-handler/trash" = "pcmanfm.desktop";
      "image/webp" = "org.nomacs.ImageLounge.desktop";
      "image/png" = "org.nomacs.ImageLounge.desktop";
      "image/jpeg" = "org.nomacs.ImageLounge.desktop";
      "image/jpg" = "org.nomacs.ImageLounge.desktop";
      "image/gif" = "org.nomacs.ImageLounge.desktop";
#      "application/zip" = ["xarchiver.desktop"];
    };
  };

  nixpkgs.config = { allowUnfree = true; };

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

