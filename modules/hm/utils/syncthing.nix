{ 
  pkgs,
  lib, 
  config,
  ... 
}:

let
  cfg = config.hmModules.syncthing;
in
  {
    options.hmModules.syncthing = {
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
