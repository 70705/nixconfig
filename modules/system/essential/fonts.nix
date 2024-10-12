{
  pkgs,
  ...
}:

{
  fonts = {
    fontconfig.enable = true;

    packages = with pkgs; [
      noto-fonts-cjk-sans
      font-awesome
      (pkgs.nerdfonts.override {
        fonts = [
          "NerdFontsSymbolsOnly"
          "Iosevka"
          "IosevkaTerm"
          "MartianMono"
          "Hack"
        ];
      })

      xorg.fontcronyxcyrillic
      weather-icons
    ];
  };
}
