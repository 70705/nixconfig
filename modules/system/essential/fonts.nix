{pkgs, ...}: {
  fonts = {
    fontconfig = {
      enable = true;
    };

    packages = with pkgs; [
      dejavu_fonts
      freefont_ttf
      gyre-fonts
      liberation_ttf
      unifont
      unifont_upper
      unifont-csur
      noto-fonts
      noto-fonts-emoji
      noto-fonts-extra
      noto-fonts-cjk-sans
      font-awesome
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term
      nerd-fonts.martian-mono
      nerd-fonts.hack
      xorg.fontcronyxcyrillic
      weather-icons
    ];
  };
}
