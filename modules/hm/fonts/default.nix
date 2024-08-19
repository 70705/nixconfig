{
  pkgs, 
  ... 
}:

{
    home.packages = with pkgs; [
    
    noto-fonts-cjk-sans
    hack-font
    font-awesome
    (pkgs.nerdfonts.override {fonts = ["NerdFontsSymbolsOnly" "IntelOneMono" "Iosevka" "IosevkaTerm" "GeistMono" "JetBrainsMono" "MartianMono"];})
    xorg.fontcronyxcyrillic
    weather-icons

  ];

  fonts.fontconfig.enable = true;
}
