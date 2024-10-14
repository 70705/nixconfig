{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.system.gaming;
in
{

  imports = [
    ./soundspaceplus
    ./retroarch.nix
  ];

  options.modules.system.gaming = {
    enable = lib.mkEnableOption "gaming";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      gamemode.enable = true;

      steam = {
        enable = true;
        package = pkgs.steam.override {
          extraEnv = {
            MANGOHUD = true;
          };
        };

        platformOptimizations.enable = true;
        remotePlay.openFirewall = true;
        extraCompatPackages = with pkgs; [ proton-ge-bin ];
        extraPackages = with pkgs; [ gamescope ];
      };
    };

    environment.systemPackages = with pkgs; [
      vesktop
      prismlauncher
      wineWow64Packages.stagingFull
      #inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
      #inputs.rhythia.packages.${pkgs.system}.sound-space-plus
      # (inputs.nix-gaming.packages.${pkgs.system}.osu-stable.override { wine = inputs.nix-gaming.packages.${pkgs.system}.wine-tkg; tricks = [ "gdiplus" "dotnet48" "meiryo" "allfonts"]; })
    ];

  };
}
