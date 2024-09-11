{ 
  pkgs,
  lib, 
  config,
  ... 
}:

let
  cfg = config.hmModules.utils.yazi;
in
  {
    options.hmModules.utils.yazi = {
      enable = lib.mkEnableOption "yazi";
    };

    config = lib.mkIf cfg.enable {
      programs.yazi = {
        enable = true;
        enableZshIntegration = true;
        package = pkgs.yazi;
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
