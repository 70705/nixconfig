{ 
  lib, 
  config,
  ... 
}:

let
  cfg = config.modules.home.utils.yazi;
  yaziAddons = import ./yaziAddons/npins;
  addon = param: yaziAddons.${param}.outPath;

in
  {
    options.modules.home.utils.yazi = {
      enable = lib.mkEnableOption "yazi";
    };

    config = lib.mkIf cfg.enable {
      programs.yazi = {
        enable = true;
        enableZshIntegration = true;

        plugins = {
          "eza-preview" = addon "eza-preview.yazi";
          "ouch" = addon "ouch.yazi";
        };

        settings = {

          manager = {
            sort_dir_first = true;
            sort_by = "natural";
          };

          plugin = {
            prepend_previewers = [
              { name = "*/"; run = "eza-preview"; }
              { mime = "application/*zip"; run = "ouch"; }
              { mime = "application/x-tar"; run = "ouch"; }
              { mime = "application/x-bzip2"; run = "ouch"; }
              { mime = "application/x-7z-compressed"; run = "ouch"; }
              { mime = "application/x-rar"; run = "ouch"; }
              { mime = "application/x-xz"; run = "ouch"; }
            ];
          };
        };
      };

      xdg.desktopEntries = {
        yazi = {
          name = "Yazi";
          comment = "Blazing fast terminal file manager written in Rust, based on async I/O";
          exec = "foot yazi %f";
          mimeType = [ "inode/directory" ];
          categories = [ "System" "FileTools" "FileManager" "Utility" "Core" ];
          terminal = false;
          icon = "yazi";
      };
    };
  };
}
