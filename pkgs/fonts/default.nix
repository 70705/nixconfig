{
  pkgs, 
  ... 
}:

{
    home.packages = with pkgs; [
    
    noto-fonts-cjk-sans
    hack-font
    font-awesome
    (pkgs.nerdfonts.override {fonts = ["nerdfontssymbolsonly"];})
    xorg.fontcronyxcyrillic

  ];

  fonts.fontconfig.enable = true;
}
