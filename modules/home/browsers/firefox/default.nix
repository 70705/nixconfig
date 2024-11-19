{
  pkgs,
  lib,
  config,
  ...
}:
let
  firefox-addons = pkgs.callPackage ./customAddons.nix {
    inherit (pkgs.nur.repos.rycee.firefox-addons) buildFirefoxXpiAddon;
  };
  cfg = config.modules.home.browser.firefox;
  pins = import ./npins;
  betterfox = pins.Betterfox.outPath;
  betterfoxPatched = pkgs.runCommand "betterfox-patched" { } ''
    cp ${betterfox}/user.js user.js
    sed -i 's/user_pref("browser.search.suggest.enabled", false);/user_pref("browser.search.suggest.enabled", true);/' user.js
    cp ${betterfox}/Smoothfox.js Smoothfox.js
    mkdir -p $out
    mv user.js Smoothfox.js $out
  '';

in
{
  options.modules.home.browser.firefox = {
    enable = lib.mkEnableOption "firefox";
  };

  config = lib.mkIf cfg.enable {
    stylix.targets.firefox.profileNames = [ "totos" ];
    home.sessionVariables = {
      MOZ_DISABLE_RDD_SANDBOX = 1;
    };

    programs.firefox = {
      enable = true;
      nativeMessagingHosts = with pkgs; [
        firefoxpwa
        vdhcoapp
      ];

      policies = {
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxScreenshots = true;
        DisableFormHistory = true;
        DisableFeedbackCommands = true;
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableSetDesktopBackground = true;
        DontCheckDefaultBrowser = true;
        EnableTrackingProtection = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
      };

      profiles.totos = {
        id = 0;

        extensions =
          with pkgs.nur.repos.rycee.firefox-addons;
          [
            auto-tab-discard
            augmented-steam
            darkreader
            fastforwardteam
            ublock-origin
            enhanced-h264ify
            sponsorblock
            languagetool
            web-scrobbler
            raindropio
            violentmonkey
            keepassxc-browser
            sidebery
            gesturefy
            simple-dark-vlasak
            multi-account-containers
            control-panel-for-twitter
            faststream
            improved-tube
            search-by-image
            mal-sync
            video-downloadhelper
            hover-zoom-plus
            new-tab-override
            surfingkeys
            tab-session-manager
          ]
          ++ (with firefox-addons; [
            pwas-for-firefox
            nyancat-youtube-progressbar
          ]);

        userChrome = builtins.readFile ./userChrome.css;
        #userContent = builtins.readFile ./userContent.css;

        search = {
          default = "SearXNG";
          privateDefault = "SearXNG";
          force = true;
          engines = {
            "SearXNG" = {
              urls = [
                { template = "http://searxng.totos.home.arpa/?q={searchTerms}"; }
                {
                  template = "http://searxng.totos.home.arpa/autocompleter?q={searchTerms}";
                  type = "application/x-suggestions+json";
                }
              ];
              updateInterval = 24 * 60 * 60 * 1000; # every day
              iconUpdateURL = "https://raw.githubusercontent.com/searxng/searxng/refs/heads/master/src/brand/searxng-wordmark.svg";
              definedAliases = [ "@sx" ];
            };

            "YouTube" = {
              urls = [ { template = "https://www.youtube.com/results?search_query={searchTerms}"; } ];
              updateInterval = 24 * 60 * 60 * 1000; # every day
              iconUpdateURL = "https://www.svgrepo.com/show/13671/youtube.svg";

              definedAliases = [ "@yt" ];
            };

            "Firefox Addons API" = {
              urls = [ { template = "https://addons.mozilla.org/api/v5/addons/search/?q={searchTerms}"; } ];
              updateInterval = 24 * 60 * 60 * 1000; # every day
              iconUpdateURL = "https://upload.wikimedia.org/wikipedia/commons/a/a0/Firefox_logo,_2019.svg";

              definedAliases = [ "@fex" ];
            };

            "Home Manager Options" = {
              urls = [
                { template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master"; }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";

              definedAliases = [ "@hm" ];
            };

            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages?channel=unstable";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "Nix Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options?channel=unstable";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@no" ];
            };

            "Google".metaData.alias = "@g";
          };
        };

        settings = {
          "extensions.autoDisableScopes" = 0;
          "layout.css.grid-template-masonry-value.enabled" = true;
          "dom.security.sanitizer.enabled" = true;
          "extensions.postDownloadThirdPartyPrompt" = false;
          "browser.startup.page" = 3;
          "svg.context-properties.content.enabled" = true;
          "font.size.variable.x-western" = 18;
          "font.size.monospace.x-western" = 14;
          "media.ffmpeg.vaapi.enabled" = true;
          "media.rdd-ffmpeg.enabled" = true;
          "media.av1.enabled" = false;
          "gfx.x11-egl.force-enabled" = true;
          "widget.dmabuf.force-enabled" = true;
        };
        extraConfig = ''
          ${builtins.readFile "${betterfoxPatched}/user.js"}
          ${builtins.readFile "${betterfoxPatched}/Smoothfox.js"}
        '';
      };
    };
  };
}
