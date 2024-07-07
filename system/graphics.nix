{
  config,
  ... 
}:

{

  hardware.graphics = { 
    enable = true;
    enable32Bit = true;
#    extraPackages = with pkgs; [
#      vaapiVdpau
#      libvdpau-va-gl
#      nvidia-vaapi-driver
#      vulkan-loader
#      vulkan-tools
#      libGL
#      libGLU
#    ];
#    extraPackages32 = with pkgs.pkgsi686Linux; [
#      vaapiVdpau
#      libvdpau-va-gl
#      nvidia-vaapi-driver
#      vulkan-loader
#      vulkan-tools
#      libGL
#      libGLU
#    ];
   };

#   environment.variables = {
#      LIBVA_DRIVER_NAME = "vdpau";
#    };

   services.xserver.videoDrivers = ["nvidia"];
  
   hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
   };
}
