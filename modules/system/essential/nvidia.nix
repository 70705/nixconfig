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
    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "565.57.01";
      sha256_64bit = "sha256-buvpTlheOF6IBPWnQVLfQUiHv4GcwhvZW3Ks0PsYLHo=";
      sha256_aarch64 = lib.fakeSha256;
      openSha256 = lib.fakeSha256;
      settingsSha256 = lib.fakeSha256;
      persistencedSha256 = lib.fakeSha256;
    };
  };
}
