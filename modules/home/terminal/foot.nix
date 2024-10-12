{
  config,
  lib, 
  ...
}:

{
  programs.foot = {
    enable = lib.mkIf config.modules.home.wm.hypr.enable true;
    settings = {
      main = {
        font = lib.mkForce "JetBrainsMono Nerd Font:style=Bold:size=12";
      };
    };
  };
}
