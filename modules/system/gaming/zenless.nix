{
  config,
  lib,
  inputs,
  ...
}:

let
  cfg = config.modules.system.gaming.zenless;
in
{

  imports = [
    inputs.aagl.nixosModules.default
  ];

  options.modules.system.gaming.zenless = {
    enable = lib.mkEnableOption "zenless";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      sleepy-launcher = {
        enable = true;
        package = inputs.aagl.packages.x86_64-linux.sleepy-launcher;
      };
    };
  };
}
