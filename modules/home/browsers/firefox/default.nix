{
  pkgs,
  lib,
  config,
  ...
}: let
  firefox-addons = pkgs.callPackage ./customAddons.nix {
    inherit (pkgs.nur.repos.rycee.firefox-addons) buildFirefoxXpiAddon;
  };
  cfg = config.modules.home.browser.firefox;
  pins = import ./npins;
  betterfox = pins.Betterfox.outPath;

  chrome = ''
    /* Hide horizontal tabs at the top of the window */
    #main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar {
      opacity: 0;
      pointer-events: none;
    }
    #main-window #TabsToolbar {
        visibility: collapse !important;
    }
    /* Hide the "Tree Style Tab" header at the top of the sidebar */
    #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
      display: none;
    }

    #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] #sidebar-header {
      display: none;
    }

    .sidebar-splitter {
      width: 0 !important;
    }
  '';

  content = ''
    /*************************************************** Home_screen_wallpaper ***************************************************/

    @-moz-document url("about:newtab"), url("about:home") {
        body {
            overflow: hidden !important;
        }
        #root {
            background-image: url("my_wallpaper.jpg") !important;
            background-size: cover !important;
        }
        /* Hide the ugly logo & wordmark sorry Mozilla */
        .logo-and-wordmark {
            visibility: hidden !important;
        }
        /* Make the search bar rounded */
        #newtab-search-text,
        #searchSubmit {
        border-radius: 50px !important;
      }
      .search-wrapper .search-inner-wrapper {
        margin: 10px !important; }
      .search-wrapper{ padding-top: 9px !important}
    }

    /*********************************************** TOP_sites_settings **************************************************/
    @-moz-document url-prefix(about:newtab){
    .top-site-outer .title {
      /*color: black !important;*/ /*change color of the texts of the "top_sites"*/
      }
    .top-site-outer .title {
      font-size: 100px;
      }
    .top-site-outer .title {
      font-weight: bold;
      }
    .top-site-outer .top-site-inner {
      width: 50px !important;
      height: 50px !important;
      }
    .top-site-outer .tile {
      width: 40px !important;
      height: 40px !important;
      }
    }
    .top-site-outer:is(.active, :focus, :hover) { /*Remove dark-gray mouse hover box*/
        box-shadow: none !important;
        background:transparent !important;
    }
    @-moz-document url("about:home"), url("about:newtab"){
      .tile > .icon-wrapper{
        width: 100% !important;
        height: 100% !important;
      }
      .icon-pin-small{ display: none !important; }
    }

    /*********************************************** Dark_mode_pdf **************************************************/
    @-moz-document regexp(".+\.pdf$"){
        .pdfViewer .page{ background: #38383D !important }
        .loadingIcon+.canvasWrapper{ visibility: hidden }
    }
    @-moz-document regexp("^(?!.*\\.pdf\\?n).*") {
        #sidebarContainer > #sidebarContent > #thumbnailView {
            --sidebaritem-bg-color: #38383D;
        }

        #viewerContainer > #viewer .page > .canvasWrapper > canvas {
            filter: grayscale(10%) invert(90%);
        }

        #sidebarContainer > #sidebarContent > #thumbnailView .thumbnailImage {
            filter: grayscale(10%) invert(90%);
            box-shadow: 0 0 0 1px hsla(0, 0%, 100%, 0.5), 0 2px 8px hsla(0, 0%, 100%, 0.3) !important;
        }
    }

    /*********************************************** Thin_scroll_bar *****************************************************/
    :root{ scrollbar-color: rgb(210,210,210) rgb(42,42,46) }
    *{ scrollbar-width: thin } '';

  betterfoxPatched = pkgs.runCommand "betterfox-patched" {} ''
    cp ${betterfox}/user.js user.js
    sed -i 's/user_pref("browser.search.suggest.enabled", false);/user_pref("browser.search.suggest.enabled", true);/' user.js
    cp ${betterfox}/Smoothfox.js Smoothfox.js
    mkdir -p $out
    mv user.js Smoothfox.js $out
  '';
in {
  options.modules.home.browser.firefox = {
    enable = lib.mkEnableOption "firefox";
  };

  config = lib.mkIf cfg.enable {
    stylix.targets.firefox.profileNames = ["totos"];

    programs.firefox = {
      enable = true;
      nativeMessagingHosts = with pkgs; [
        ff2mpv-rust
        #        firefoxpwa
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

        extensions = {
          packages = with pkgs.nur.repos.rycee.firefox-addons;
            [
              auto-tab-discard
              augmented-steam
              darkreader
              fastforwardteam
              ublock-origin
              enhanced-h264ify
              sponsorblock
              languagetool
              violentmonkey
              canvasblocker
              keepassxc-browser
              sidebery
              gesturefy
              simple-dark-vlasak
              multi-account-containers
              control-panel-for-twitter
              faststream
              improved-tube
              mal-sync
              tab-session-manager
            ]
            ++ (with firefox-addons; [
              pwas-for-firefox
              maxurl
            ]);
        };

        userChrome = chrome;
        #userContent = content;

        search = {
          default = "google";
          privateDefault = "google";
          force = true;
          engines = {
            "youtube" = {
              urls = [{template = "https://www.youtube.com/results?search_query={searchTerms}";}];
              updateInterval = 24 * 60 * 60 * 1000; # every day
              icon = "https://www.svgrepo.com/show/13671/youtube.svg";

              definedAliases = ["@yt"];
            };

            "Firefox Addons API" = {
              urls = [{template = "https://addons.mozilla.org/api/v5/addons/search/?q={searchTerms}";}];
              updateInterval = 24 * 60 * 60 * 1000; # every day
              icon = "https://upload.wikimedia.org/wikipedia/commons/a/a0/Firefox_logo,_2019.svg";

              definedAliases = ["@fex"];
            };

            "Home Manager Options" = {
              urls = [
                {template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master";}
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";

              definedAliases = ["@hm"];
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
              definedAliases = ["@np"];
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
              definedAliases = ["@no"];
            };

            "google".metaData.alias = "@g";
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
          "ui.key.menuAccessKeyFocuses" = false;
        };
        extraConfig = ''
          ${builtins.readFile "${betterfoxPatched}/user.js"}
        '';
      };
    };
  };
}
