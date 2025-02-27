{
  buildFirefoxXpiAddon,
  lib,
}: {
  pwas-for-firefox = buildFirefoxXpiAddon rec {
    pname = "pwas-for-firefox";
    version = "2.12.3";
    addonId = "firefoxpwa@filips.si";
    url = "https://addons.mozilla.org/firefox/downloads/file/4360044/pwas_for_firefox-2.12.5.xpi";
    sha256 = "cc8caf700222fc062795bde1081a14395e55b1b6a50a4519c8741d74346b6b11";
    meta = with lib; {
      homepage = "https://github.com/filips123/PWAsForFirefox";
      description = "A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox";
      license = licenses.mpl20;
      platforms = platforms.all;
    };
  };
  maxurl = buildFirefoxXpiAddon rec {
    pname = "Image Max URL";
    version = "2024.8.0";
    addonId = "maxurl@qsniyg";
    url = "https://addons.mozilla.org/firefox/downloads/file/4338616/image_max_url-2024.8.0.xpi";
    sha256 = "e4beedf432789d35cbddec2a01e59e7f95ced09b9cf7e49cb7985e2055aba17e";
    meta = with lib; {
      homepage = "https://github.com/qsniyg/maxurl";
      description = "Finds larger/original versions of images (supporting 9400+ websites), including a powerful image popup feature";
      license = licenses.mpl20;
      platforms = platforms.all;
    };
  };
  nyancat-youtube-progressbar = buildFirefoxXpiAddon rec {
    pname = "nyancat-youtube-progressbar";
    version = "3.0";
    addonId = "{c3348e96-6d84-47dc-8252-4b8493299efc}";
    url = "https://addons.mozilla.org/firefox/downloads/file/3975526/nyan_cat_youtube_enhancement-3.0.xpi";
    sha256 = "ac69aa0e98a6df660c9fdefa6f0b7b9a9de1340cc332f7aeaf13183d75d59b43";
    meta = with lib; {
      homepage = "https://github.com/fzramos/nyan-ff-addon";
      description = "Adds a running Nyan Cat and Rainbow Streak to YouTube video progress bars.";
      license = licenses.mpl20;
      platforms = platforms.all;
    };
  };
}
