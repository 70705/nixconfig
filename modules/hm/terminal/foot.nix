{ 
  lib, 
  ...
}:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "JetBrainsMono Nerd Font:style=Bold:size=11";
      };
    };
  };
}
