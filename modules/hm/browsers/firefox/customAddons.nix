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
}
