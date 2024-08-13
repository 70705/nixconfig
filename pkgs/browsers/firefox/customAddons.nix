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
}
