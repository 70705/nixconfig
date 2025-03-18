{
  config,
  lib,
  ...
}: {
  programs.foot = {
    enable = false;
    settings = {
      main = {
        font = lib.mkForce "JetBrainsMono Nerd Font:style=Bold:size=12";
      };
    };
  };
}
