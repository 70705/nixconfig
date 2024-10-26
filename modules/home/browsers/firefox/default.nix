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
          ]
          ++ (with firefox-addons; [
            pwas-for-firefox
            nyancat-youtube-progressbar
          ]);

        userChrome = builtins.readFile ./userChrome.css;
        #userContent = builtins.readFile ./userContent.css;

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
          ${builtins.readFile "${betterfox}/user.js"}
          ${builtins.readFile "${betterfox}/Smoothfox.js"}
        '';
      };
    };
  };
}
