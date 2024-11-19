{
  lib,
  config,
  ...
}:

{
  services.mako = {
    enable = lib.mkIf config.modules.home.wm.hypr.enable true;
    ignoreTimeout = true;
    defaultTimeout = 7500;
    layer = "overlay";
    borderRadius = 3;
    borderSize = 2;
  };
}
