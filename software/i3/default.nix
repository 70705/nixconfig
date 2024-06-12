{ ... }:

{
  imports = [
    ./picom.nix
    ./i3.nix
    ./polybar.nix
  ];

    home = {
      file = {
        ".config/pcmanfm/default/pcmanfm.conf" = {
          source = ./pcmanfm.conf;
          force = true;
        };

        ".themes" = {
          source = ./themes;
        };

        ".icons" = {
          source = ./icons;
        };

        ".local/share/fonts" = {
          source = ./fonts;
        };
    };
};

  gtk = {
    enable = true;
#    iconTheme.name = "Chicago95-tux";
    theme.name = "TokyoNight";  
  };
}
