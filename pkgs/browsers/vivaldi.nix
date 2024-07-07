{ 
  pkgs,
  ... 
}:

{

  programs.chromium = {
    enable = true;
    package = pkgs.vivaldi;
    commandLineArgs = [ "--enable-blink-features=MiddleClickAutoscroll"
                        "--enable-features=VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,WebUIDarkMode"
                        "--force-dark-mode"
                        "--start-maximized"
                        "--enable-zero-copy"
                        "--ignore-gpu-blocklist"
                        "--enable-oop-rasterization"
                        "--enable-raw-draw"
                        "--enable-gpu-rasterization"
                        "--use-vulkan"
                        "--disable-gpu-sandbox"];
  };

}
