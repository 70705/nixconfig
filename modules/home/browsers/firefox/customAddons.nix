{ buildFirefoxXpiAddon, lib }:

{
  pwas-for-firefox = buildFirefoxXpiAddon rec {
    pname = "pwas-for-firefox";
    version = "2.12.3";
    addonId = "firefoxpwa@filips.si";
    url = "https://addons.mozilla.org/firefox/downloads/file/4350177/pwas_for_firefox-2.12.3.xpi";
    sha256 = "71ac6fd32740cf6bbaf8a1ba24b6b8b6d68e291b0d750ce3dabb8aa009d5c12a";
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
}
