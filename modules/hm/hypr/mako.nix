{ 
  lib, 
  config,
  ... 
}:

let
  cfg = config.hmModules.hypr.mako;
in
  {
    options.hmModules.hypr.mako = {
      enable = lib.mkEnableOption "mako";
    };

    config = lib.mkIf cfg.enable {
      services.mako = {
        enable = true;
        ignoreTimeout = true;
        defaultTimeout = 2500;
        borderRadius = 3;
        borderSize = 2;
      };
    };
  }
