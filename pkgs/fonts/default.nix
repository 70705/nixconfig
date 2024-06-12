{
  pkgs, 
  ... 
}:

{
    home.packages = with pkgs; [
    
    noto-fonts-cjk-sans
    hack-font
    font-awesome
    (pkgs.nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
    xorg.fontcronyxcyrillic

  ];

  fonts.fontconfig.enable = true;
}
