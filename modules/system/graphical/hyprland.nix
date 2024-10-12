{
  pkgs,
  config,
  inputs,
  lib,
  ...
}:

let
  cfg = config.modules.system.graphical.hyprland;
in
{
  options.modules.system.graphical.hyprland = {
    enable = lib.mkEnableOption "hyprland";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    services = {
      libinput = {
        enable = true;

        mouse = {
          accelProfile = "flat";
        };

        touchpad = {
          accelProfile = "flat";
        };
      };

      displayManager = {
        enable = true;

        defaultSession = "hyprland";

        autoLogin = {
          user = "victor";
          enable = true;
        };

        sddm = {
          enable = true;
          autoNumlock = true;
          wayland.enable = true;
        };
      };
    };

    stylix = {
      enable = true;
      image = ../../home/graphical/hypr/wallpaper.png;
      autoEnable = true;

      cursor = {
        package = pkgs.quintom-cursor-theme;
        name = "Quintom_Ink";
        size = 22;
      };

      fonts = {
        serif = {
          package = (pkgs.nerdfonts.override { fonts = [ "Ubuntu" ]; });
          name = "Ubuntu Nerd Font";
        };

        sansSerif = config.stylix.fonts.serif;

        monospace = {
          package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
          name = "JetBrainsMono Nerd Font";
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
      };

      base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-mayhem.yaml";
    };

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;

      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
      ];

      configPackages = [
        pkgs.xdg-desktop-portal-gtk
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
      ];
    };
  };
}
