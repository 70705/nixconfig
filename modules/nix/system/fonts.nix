{
  pkgs, 
  ... 
}:

{
  fonts = {
    fontconfig.enable = true;

    packages = with pkgs; [
      noto-fonts-cjk-sans
      hack-font
      font-awesome
      (pkgs.nerdfonts.override {fonts = ["NerdFontsSymbolsOnly" "IntelOneMono" "Iosevka" "IosevkaTerm" "GeistMono" "JetBrainsMono" "MartianMono"];})
      xorg.fontcronyxcyrillic
      weather-icons
    ];
  };
}
