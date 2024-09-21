{ 
  lib, 
  config,
  ... 
}:

{
  services.mako = {
    enable = lib.mkIf config.hmModules.hypr.enable true; 
    ignoreTimeout = true;
    defaultTimeout = 7500;
    borderRadius = 3;
    borderSize = 2;
  };
}
