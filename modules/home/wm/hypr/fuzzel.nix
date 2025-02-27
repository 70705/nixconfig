{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.fuzzel = {
    enable = lib.mkIf config.modules.home.wm.hypr.enable true;
    settings = {
      main = {
        terminal = "${pkgs.foot}/bin/foot";
        icons-enabled = true;
        use-bold = true;
        icon-theme = "Vimix-White";
        image-size-ratio = 0.25;
        font = lib.mkForce "MartianMono Nerd FontMartianMono NF:size=12";
      };
    };
  };
}
