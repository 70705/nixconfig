{
  config,
  lib, 
  ...
}:

{
  programs.foot = {
    enable = lib.mkIf config.hmModules.hypr.enable true;
    settings = {
      main = {
        font = lib.mkForce "JetBrainsMono Nerd Font:style=Bold:size=12";
      };
    };
  };
}
