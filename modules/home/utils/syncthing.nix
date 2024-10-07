{ 
  pkgs,
  lib, 
  config,
  ... 
}:

let
  cfg = config.modules.home.utils.syncthing;
in
  {
    options.modules.home.utils.syncthing = {
      enable = lib.mkEnableOption "syncthing";
    };

    config = lib.mkIf cfg.enable {
      
      systemd.user.services.syncthingtray.Service.ExecStart = lib.mkForce
      "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/sleep 5; ${pkgs.syncthingtray-minimal}/bin/syncthingtray'";

      services = {
        syncthing = {
          enable = true;
          tray.enable = true;
        };
      };
    };
  }
