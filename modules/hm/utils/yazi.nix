{ 
  pkgs,
  lib, 
  config,
  ... 
}:

let
  cfg = config.hmModules.utils.yazi;
  yaziAddons = import ./yaziAddons/nix/sources.nix;
  addon = param: yaziAddons.${param}.outPath;

in
  {
    options.hmModules.utils.yazi = {
      enable = lib.mkEnableOption "yazi";
    };

    config = lib.mkIf cfg.enable {
      programs.yazi = {
        enable = true;
        enableZshIntegration = true;

        plugins = {
          "eza-preview" = addon "eza-preview.yazi";
        };

        settings = {
          plugin = {
            prepend_previewers = [ { name = "*/"; run = "eza-preview"; } ];
          };
        };
      };

      xdg.desktopEntries = {
        yazi = {
          name = "Yazi";
          comment = "Blazing fast terminal file manager written in Rust, based on async I/O";
          exec = "kitty yazi %f";
          mimeType = [ "inode/directory" ];
          categories = [ "System" "FileTools" "FileManager" "Utility" "Core" ];
          terminal = false;
          icon = "yazi";
      };
    };
  };
}
