{
  config,
  lib, 
  ...
}:

{
  programs.foot = {
    enable = lib.mkIf config.modules.home.graphical.hypr.enable true;
    settings = {
      main = {
        font = lib.mkForce "JetBrainsMono Nerd Font:style=Bold:size=12";
      };
    };
  };
}
