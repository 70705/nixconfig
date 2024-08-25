{ 
  pkgs,
  config,
  inputs,
  lib,
  ... 
}:

let
  cfg = config.nixModules.wayland;
in
  {
    options.nixModules.wayland = {
      enable = lib.mkEnableOption "wayland";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
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
        autoLogin.user = "victor";
        autoLogin.enable = true;

        sddm = {
          enable = true;
          autoNumlock = true;
          wayland.enable = true;
        };
      };
    };
  };
}

