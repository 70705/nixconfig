{
  pkgs,
  lib,
  config,
  ...
}:

{

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  environment.variables = {
    NVD_BACKEND = "direct";
    LIBVA_DRIVER_NAME = "nvidia";
    NVD_MAX_INSTANCES = 50;
  };
  environment.systemPackages = with pkgs; [ nvidia-vaapi-driver ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;
    nvidiaSettings =
      if config.modules.system.wm.hyprland.enable then
        false
      else if config.modules.system.wm.i3.enable then
        true
      else
        false;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
}
