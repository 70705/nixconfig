{ 
  pkgs,
  lib,
  ...
}:

{
  systemd.user.services.syncthingtray.Service.ExecStart = lib.mkForce
  "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/sleep 5; ${pkgs.syncthingtray-minimal}/bin/syncthingtray'";

  services = {
    syncthing = {
      enable = true;
      tray.enable = true;
    };
  };
}
