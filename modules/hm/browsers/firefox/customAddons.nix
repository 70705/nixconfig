{ buildFirefoxXpiAddon, lib }:

{
  pwas-for-firefox = buildFirefoxXpiAddon rec {
    pname = "pwas-for-firefox";
    version = "2.12.1";
    addonId = "firefoxpwa@filips.si";
    url = "https://addons.mozilla.org/firefox/downloads/file/4293028/pwas_for_firefox-2.12.1.xpi";
    sha256 = "9bc04202542ddfb4715675b0fb68483e79a87d389c35ae4e5a4c17a7f2177566";
    meta = with lib; {
      homepage = "https://github.com/filips123/PWAsForFirefox";
      description = "A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox";
      license = licenses.mpl20;
      platforms = platforms.all;
    };
  };
  popupoff = buildFirefoxXpiAddon rec {
    pname = "popupoff";
    version = "2.1.3";
    addonId = "{154cddeb-4c8b-4627-a478-c7e5b427ffdf}";
    url = "https://addons.mozilla.org/firefox/downloads/file/4150911/popupoff-2.1.3.xpi";
    sha256 = "1fzq1vlzbqzgq2knqlxrrff889js5ll03r35njs4z6vs5r4czani";
    meta = with lib; {
      homepage = "https://popupoff.org/";
      description = "Removes and prevents popups, overlays and cookie notifications, other tools do not. Enjoy the original look of the internet.";
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

  selecton = buildFirefoxXpiAddon rec {
    pname = "selecton";
    version = "3.7.8";
    addonId = "selection_action@emvaized.com";
    url = "https://addons.mozilla.org/firefox/downloads/file/4348893/selection_actions-3.7.8.xpi";
    sha256 = "75112544a3b0cfcce3e641a52f69a15d5e8d1982569c646d69e433fc85fea18f";
    meta = with lib; {
      homepage = "https://github.com/emvaized/selecton-extension/";
      description = "Get customizable pop-up with action buttons on text selection!";
      license = licenses.mit;
      platforms = platforms.all;
    };
  };
}
