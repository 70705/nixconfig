{pkgs, ...}: {
  fonts = {
    fontconfig.enable = true;

    packages = with pkgs; [
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
