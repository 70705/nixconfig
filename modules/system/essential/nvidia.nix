{
  config,
  ...
}:

{

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

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
