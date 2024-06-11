{ 
  pkgs,
  ...
}:

{

    home.file.".config/qutebrowser/dracula" = {
      source = ./qute/dracula;
      force = true;
    };

    home.file.".config/qutebrowser/greasemonkey" = {
      source = ./qute/greasemonkey;
      force = true;
      recursive = true;
    };

    programs.qutebrowser = {
      enable = true;
      package = pkgs.qutebrowser.override { 
      enableWideVine = true;
    };

    extraConfig = ''
      import dracula.draw

      dracula.draw.blood(c, {
          'spacing': {
              'vertical': 6,
              'horizontal': 8
          }
      })'';

    searchEngines = { "DEFAULT" = "https://www.google.com/search?q={}";};

    aliases = { "mpv" = "spawn --userscript /home/victor/.config/qutebrowser/greasemonkey/view_in_mpv.user.js";};


    settings = {
      auto_save.session = true;
      colors.webpage = {
      darkmode.enabled = true;
      darkmode.policy.images = "never";
      preferred_color_scheme = "dark";
    };

    session.lazy_restore = true;

      content = {
        autoplay = false;
        blocking = {
          enabled = true;
          method = "both";
          adblock.lists = ["https://raw.githubusercontent.com/badmojr/1Hosts/master/Lite/adblock.txt" "https://easylist.to/easylist/easylist.txt" "https://easylist.to/easylist/easyprivacy.txt"];
      };
    };

      url = {
        default_page = "https://google.com";
        start_pages = "https://google.com";
    };

      tabs = {
        position = "left";
        width = "11%";
      };

    };
  };
}
