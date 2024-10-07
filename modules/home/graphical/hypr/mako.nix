{ 
  lib, 
  config,
  ... 
}:

{
  services.mako = {
    enable = lib.mkIf config.modules.home.graphical.hypr.enable true; 
    ignoreTimeout = true;
    defaultTimeout = 7500;
    borderRadius = 3;
    borderSize = 2;
  };
}
